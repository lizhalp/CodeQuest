import { Controller } from "@hotwired/stimulus";
import { cable } from "@hotwired/turbo-rails";

export default class extends Controller {
  static targets = ["localVideo", "remoteVideoContainer", "joinButton", "leaveButton", "callStatus"];
  static values = { participantId: Number, userId: Number };

  connect() {
    this.pcPeers = {};
    this.localStream = null;
    this.channel = null;
    this.participantChannel = `call_channel_user_${this.participantIdValue}`;
    console.log("VideoCall controller connected");
    console.log("User ID:", this.userIdValue);
    console.log("Participant ID:", this.participantIdValue);
  }

  async startStream() {
    try {
      this.localStream = await navigator.mediaDevices.getUserMedia({ video: true, audio: false });
      this.localVideoTarget.srcObject = this.localStream;
    } catch (error) {
      console.error("Error accessing media devices.", error);
    }
  }

  async joinCall() {
    if (!this.channel) {
      this.channel = await cable.subscribeTo(
        { channel: "CallChannel", user_id: this.participantIdValue },
        {
          received: (data) => this.handleSignal(data),
        }
      );
      console.log(`Connected to call_channel_user_${this.participantIdValue}`);
      this.broadcastData({ type: "JOIN_CALL", from: this.userIdValue, to: this.participantIdValue });
    }
    this.startStream();
  }

  leaveCall() {
    Object.values(this.pcPeers).forEach((pc) => pc.close());
    this.pcPeers = {};
    if (this.localStream) {
      this.localStream.getTracks().forEach((track) => track.stop());
      this.localVideoTarget.srcObject = null;
    }
    if (this.channel) {
      this.channel.unsubscribe();
      this.channel = null;
    }
    this.remoteVideoContainerTarget.innerHTML = "";
    this.broadcastData({ type: "LEAVE_CALL", from: this.userIdValue, to: this.participantIdValue });
    this.updateCallStatus("Call ended");
  }

  broadcastData(data) {
    fetch("/calls", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        user_id: this.userIdValue, // Ensure the recipient ID is included
        data: data
      }),
    });
  }

  handleSignal(data) {
    console.log("Received signal:", data);

    switch (data.type) {
      case "START_CALL":
        this.createPeerConnection(data.from, false);
        this.updateCallStatus("Call started");
        break;
      case "JOIN_CALL":
        this.createPeerConnection(data.from, true);
        this.updateCallStatus("Participant joined the call");
        break;
      case "EXCHANGE":
        this.handleExchange(data);
        break;
      case "LEAVE_CALL":
        this.removeUser(data);
        this.updateCallStatus("Participant left the call");
        break;
    }
  }

  createPeerConnection(userId, offer) {
    const pc = new RTCPeerConnection({
      iceServers: [{ urls: "stun:stun2.l.google.com:19302" }],
    });

    this.pcPeers[userId] = pc;

    this.localStream.getTracks().forEach((track) => pc.addTrack(track, this.localStream));

    pc.onicecandidate = (event) => {
      if (event.candidate) {
        this.broadcastData({
          type: "EXCHANGE",
          from: this.userIdValue,
          to: this.participantIdValue,
          candidate: JSON.stringify(event.candidate),
        });
      }
    };

    pc.ontrack = (event) => {
      console.log("Remote track received:", event.streams[0]);
      const remoteVideo = document.createElement("video");
      remoteVideo.id = `remoteVideo-${userId}`;
      remoteVideo.autoplay = true;
      remoteVideo.playsInline = true; // Ensure the video plays inline
      remoteVideo.srcObject = event.streams[0];
      this.remoteVideoContainerTarget.appendChild(remoteVideo);
    };

    if (offer) {
      pc.createOffer()
        .then((offer) => pc.setLocalDescription(offer))
        .then(() => {
          this.broadcastData({
            type: "EXCHANGE",
            from: this.userIdValue,
            to: this.participantIdValue,
            sdp: JSON.stringify(pc.localDescription),
          });
        })
        .catch((error) => {
          console.error("Error creating or setting SDP offer:", error);
        });
    }

    return pc;
  }

  handleExchange(data) {
    let pc = this.pcPeers[data.from] || this.createPeerConnection(data.from, false);

    if (data.sdp) {
      const sdp = JSON.parse(data.sdp);
      pc.setRemoteDescription(sdp).then(() => {
        if (sdp.type === "offer") {
          pc.createAnswer()
            .then((answer) => pc.setLocalDescription(answer))
            .then(() => {
              this.broadcastData({
                type: "EXCHANGE",
                from: this.userIdValue,
                to: data.from,
                sdp: JSON.stringify(pc.localDescription),
              });
            });
        }
      });
    }

    if (data.candidate) {
      pc.addIceCandidate(new RTCIceCandidate(JSON.parse(data.candidate)));
    }
  }

  removeUser(data) {
    const remoteVideo = document.getElementById(`remoteVideo-${data.from}`);
    if (remoteVideo) remoteVideo.remove();

    if (this.pcPeers[data.from]) {
      this.pcPeers[data.from].close();
      delete this.pcPeers[data.from];
    }
  }

  updateCallStatus(status) {
    this.callStatusTarget.textContent = status;
  }
}
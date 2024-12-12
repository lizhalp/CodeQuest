import { Controller } from "@hotwired/stimulus";
import { cable } from "@hotwired/turbo-rails";

// Step 1: Get User Media: Get the user's media stream (video and audio)
// Step 2: Create Peer Connection: Create a peer connection object for the current user
//         with the STUN servers.
// Step 3: Add Tracks: Add the user's media stream tracks to the peer connection object.
// Step 4: Create Offer: Create an offer to send to the other user.'
// Step 5: Set Local Description: Set the local description of the peer connection object.
// Step 6: Broadcast Offer: Broadcast the offer to the other user.
// Step 7: Handle Exchange: Handle the exchange of SDP and ICE candidates between the users.
// Step 8: Create Answer: Create an answer to the offer received from the other user.
// Step 9: Set Remote Description: Set the remote description of the peer connection object.


export default class extends Controller {
  static targets = ["localVideo", "remoteVideo", "joinButton", "startButton", "leaveButton", "callStatus"];
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

  async startCall() {
    if (!this.channel) {
      this.channel = await cable.subscribeTo(
        { channel: "CallChannel", user_id: this.userIdValue },
        {
          received: (data) => this.handleSignal(data),
        }
      );
      console.log(`Connected to call_channel_user_${this.userIdValue}`);
      this.broadcastData({ type: "START_CALL", from: this.userIdValue, to: this.participantIdValue });
    }
    this.startStream();
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
    this.remoteVideoTarget.innerHTML = "";
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
      iceServers: [
        { urls: "stun:stun.l.google.com:19302" },
        { urls: "stun:stun.l.google.com:5349" },
        { urls: "stun:stun1.l.google.com:3478" },
        { urls: "stun:stun1.l.google.com:5349" },
        { urls: "stun:stun2.l.google.com:19302" },
        { urls: "stun:stun2.l.google.com:5349" },
        { urls: "stun:stun3.l.google.com:3478" },
        { urls: "stun:stun3.l.google.com:5349" },
        { urls: "stun:stun4.l.google.com:19302" },
        { urls: "stun:stun4.l.google.com:5349" }
    ],
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
    };

    if (offer) {
      pc.createOffer()
        .then((offer) => pc.setLocalDescription(offer).then(() => {
          console.log("Remote SDP set successfully:", offer);
        }).catch((error) => {
          console.error("Error setting remote SDP:", error);
        }))
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
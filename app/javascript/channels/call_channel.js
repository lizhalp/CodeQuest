import consumer from "channels/consumer"

consumer.subscriptions.create("CallChannel", {
  connected() {
    console.log("Connected to CallChannel");
  },
  disconnected() {
    console.log("Disconnected from CallChannel");
  },
  received(data) {
    console.log("Received data:", data);
  },
});

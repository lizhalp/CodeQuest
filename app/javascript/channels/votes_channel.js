import consumer from "channels/consumer"

consumer.subscriptions.create("VotesChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Replace the vote component when data is received
    const voteFrame = document.getElementById(`vote-component-${CONTENT_ID}`);
    if (voteFrame) {
      voteFrame.outerHTML = data;
    }
  }
});

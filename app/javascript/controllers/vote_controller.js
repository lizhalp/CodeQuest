// app/javascript/controllers/vote_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "upvoteIcon", "downvoteIcon", "counter"];

  cast(event) {
    event.preventDefault();

    const button = event.currentTarget;
    const value = parseInt(button.dataset.value, 10);
    const contentId = button.dataset.contentId;
    const userId = button.dataset.userId;
    const currentVote = parseInt(this.element.dataset.currentVote, 10);
    const newValue = currentVote === value ? 0 : value;

    fetch('/votes', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({
        vote: { value: newValue, content_id: contentId, user_id: userId }
      })
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        // Update the dataset for currentVote to reflect the new state
        this.element.dataset.currentVote = newValue;

        // Update the counter
        this.counterTarget.textContent = data.newVoteCount;

        // Update the classes for the upvote and downvote icons
        this.updateIconStyles(newValue);
      } else {
        alert('Error creating vote');
      }
    })
    .catch(error => {
      console.error('Error creating vote:', error);
    });
  }

  updateIconStyles(newValue) {
    const upvoteIcon = this.element.querySelector('[data-value="1"]');
    const downvoteIcon = this.element.querySelector('[data-value="-1"]');

    // Clear both icons' filled classes
    upvoteIcon.classList.remove('bi-hand-thumbs-up-fill', 'bi-hand-thumbs-up');
    downvoteIcon.classList.remove('bi-hand-thumbs-down-fill', 'bi-hand-thumbs-down');

    // Apply the appropriate class based on the new vote value
    if (newValue > 0) {
      upvoteIcon.classList.add('bi-hand-thumbs-up-fill');
      downvoteIcon.classList.add('bi-hand-thumbs-down');
    } else if (newValue < 0) {
      upvoteIcon.classList.add('bi-hand-thumbs-up');
      downvoteIcon.classList.add('bi-hand-thumbs-down-fill');
    } else {
      upvoteIcon.classList.add('bi-hand-thumbs-up');
      downvoteIcon.classList.add('bi-hand-thumbs-down');
    }
  }
}

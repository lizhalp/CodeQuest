import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab", "content"];

  activate(event) {
    // Change all tabs to inactive
    this.tabTargets.forEach((tab) => { tab.classList.remove("active"); });
    
    // Change the tab that was clicked on to active
    event.currentTarget.classList.add("active");  

    // Hide all content
    this.contentTargets.forEach((content) => { content.classList.add("hidden"); });

    // Unhide the content with id that matches the tabs data-content
    const content_id = event.currentTarget.dataset.content;
    document.getElementById(content_id).classList.remove("hidden");
  }

  toggleMenu() {
    const menu = this.element.querySelector('[data-tabnav-target="menu"]');
    menu.classList.toggle('hidden');
  }
}

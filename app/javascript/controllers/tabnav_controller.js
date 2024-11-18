import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab"];
  
  connect() {
    if (this.tabTargets.length > 0) {
      this.tabTargets[0].classList.add("active");
    }
  }

  activate(event) {
    this.tabTargets.forEach((tab) => tab.classList.remove("active"));
    event.currentTarget.classList.add("active");
  }
}

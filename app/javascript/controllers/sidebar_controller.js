import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["sidebarExpanded", "sidebarCollapsed"];

  connect() {
    this.sidebarCollapsedTarget.classList.add("hidden");
  }

  toggle() {
    this.sidebarExpandedTarget.classList.toggle("hidden");
    this.sidebarCollapsedTarget.classList.toggle("hidden");
  }
}

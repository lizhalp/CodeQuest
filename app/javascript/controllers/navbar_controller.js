import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {}

  toggleDarkMode() {
    document.documentElement.classList.toggle('dark');
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {}

  toggleDarkMode() {
    document.documentElement.classList.toggle('dark');
  }

  toggleMenu() {
    const menu = this.element.querySelector('[data-navbar-target="menu"]');
    menu.classList.toggle('hidden');
  }
}

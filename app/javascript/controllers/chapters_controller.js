import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chapters"
export default class extends Controller {
  static targets = ["dropdownContent", "dropdownUpButton", "dropdownDownButton"]

  connect() {
  }

  toggleDropdown() {
    this.dropdownContentTarget.classList.toggle("hidden")
    this.dropdownUpButtonTarget.classList.toggle("hidden")
    this.dropdownDownButtonTarget.classList.toggle("hidden")
  }
}
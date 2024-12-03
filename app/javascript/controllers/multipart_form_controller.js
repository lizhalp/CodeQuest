import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step", "heading"]

  connect() {
    this.showStep(0) // Initialize with the first step active
  }

  showStep(index) {
    // Update step visibility
    this.stepTargets.forEach((step, i) => {
      step.classList.toggle("hidden", i !== index)
    })

    // Update heading appearance
    this.headingTargets.forEach((heading, i) => {
      if (i === index) {
        heading.classList.add("text-pink-400", "font-bold")
      } else {
        heading.classList.remove("text-pink-400", "font-bold")
      }
    })
  }

  nextStep(event) {
    event.preventDefault()
    const currentStep = this.getCurrentStepIndex()
    this.showStep(currentStep + 1)
  }

  previousStep(event) {
    event.preventDefault()
    const currentStep = this.getCurrentStepIndex()
    this.showStep(currentStep - 1)
  }

  getCurrentStepIndex() {
    return this.stepTargets.findIndex(step => !step.classList.contains("hidden"))
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="multiple-choice-questions"
export default class extends Controller {
  static targets = ["questions", "template"];

  connect() {
    this.addQuestion = this.addQuestion.bind(this);
  }

  addQuestion(event) {
    event.preventDefault();
    const newQuestionIndex = this.questionsTarget.querySelectorAll(".nested-fields").length + 1;
    const newQuestionFields = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, newQuestionIndex);
    this.questionsTarget.insertAdjacentHTML("beforeend", newQuestionFields);
    this.updateQuestionNumbers();
  }

  removeQuestion(event) {
    event.preventDefault();
    event.target.closest(".nested-fields").remove();
    this.updateQuestionNumbers();
  }

  updateQuestionNumbers() {
    const questionElements = this.questionsTarget.querySelectorAll(".nested-fields");
    questionElements.forEach((element, index) => {
      const questionNumberElement = element.querySelector(".question-number");
      if (questionNumberElement) {
        questionNumberElement.textContent = `${index + 1}.`;
      }
    });
  }
}
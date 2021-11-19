import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form']
  connect() {
    this.formTarget.style.height = "0px"
    this.formTarget.style.overflow = "hidden"
    this.formTarget.style.transition = "height 0.2s ease-in"
  }

  expandForm(event) {
    this.formTarget.style.height = this.element.dataset.expandedHeight
    event.currentTarget.remove()
  }
}

// app/javascript/controllers/mobile_menu_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "menuOpen", "menuClose"]
  
  toggle() {
    this.menuTarget.classList.toggle('hidden')
    this.menuOpenTarget.classList.toggle('hidden')
    this.menuCloseTarget.classList.toggle('hidden')
  }
  
  hide(event) {
    if (!this.element.contains(event.target) && !this.menuTarget.classList.contains('hidden')) {
      this.menuTarget.classList.add('hidden')
      this.menuOpenTarget.classList.remove('hidden')
      this.menuCloseTarget.classList.add('hidden')
    }
  }
}

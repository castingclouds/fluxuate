// app/javascript/controllers/flash_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]
  
  connect() {
    // Add slide-in animation
    this.element.classList.add('transform', 'ease-out', 'duration-300', 'transition', 'translate-x-0', 'opacity-100', 'sm:translate-x-2')
    
    // Auto-dismiss after 2 seconds
    this.timeout = setTimeout(() => {
      this.dismiss()
    }, 2000)
  }
  
  disconnect() {
    // Clear the timeout if the controller is disconnected before the timeout completes
    if (this.timeout) {
      clearTimeout(this.timeout)
    }
  }
  
  dismiss() {
    // Add slide-out animation
    this.element.classList.remove('translate-x-0', 'opacity-100')
    this.element.classList.add('translate-x-2', 'opacity-0')
    
    // Remove the element after the animation completes
    setTimeout(() => {
      this.element.remove()
      
      // Dispatch an event that the flash was dismissed
      this.dispatch('dismissed')
    }, 300)
  }
}

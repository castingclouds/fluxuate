import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    this.submitForm = this.debounce(this.submitForm.bind(this), 300)
  }

  filter(event) {
    event.preventDefault()
    this.submitForm()
  }

  submitForm() {
    const url = new URL(this.formTarget.action)
    const formData = new FormData(this.formTarget)
    
    // Add form data to URL parameters
    for (const [key, value] of formData.entries()) {
      url.searchParams.append(key, value)
    }

    // Add frame parameter to get the Turbo Stream response
    url.searchParams.append("frame", "true")

    fetch(url, {
      headers: {
        "Accept": "text/vnd.turbo-stream.html"
      }
    })
  }

  // Debounce helper function
  debounce(func, wait) {
    let timeout
    return function executedFunction(...args) {
      const later = () => {
        clearTimeout(timeout)
        func(...args)
      }
      clearTimeout(timeout)
      timeout = setTimeout(later, wait)
    }
  }
}

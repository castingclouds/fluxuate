# Stimulus Patterns

This guide covers common patterns and best practices for using Stimulus controllers in Fluxuate.

## Basic Controller Structure

```javascript
// app/javascript/controllers/filter_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "results"]
  static values = {
    url: String,
    autoSubmit: Boolean
  }
  
  connect() {
    if (this.autoSubmitValue) {
      this.setupAutoSubmit()
    }
  }
  
  submit() {
    this.formTarget.requestSubmit()
  }
}
```

## Form Handling

### Auto-submit Form

```javascript
// app/javascript/controllers/auto_submit_controller.js
import { Controller } from "@hotwired/stimulus"
import debounce from "lodash/debounce"

export default class extends Controller {
  static targets = ["form"]
  static values = {
    delay: { type: Number, default: 300 }
  }
  
  connect() {
    this.submit = debounce(this.submit.bind(this), this.delayValue)
  }
  
  submit() {
    this.formTarget.requestSubmit()
  }
}
```

Usage in views:

```erb
<%= form_with(model: @search, 
    data: { 
      controller: "auto-submit",
      auto_submit_delay_value: 500 
    }) do |form| %>
  
  <%= form.text_field :query,
      data: { action: "input->auto-submit#submit" } %>
<% end %>
```

## Theme Switching

```javascript
// app/javascript/controllers/theme_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggle"]
  static classes = ["dark"]
  
  connect() {
    this.loadPreference()
  }
  
  toggle() {
    document.documentElement.classList.toggle(this.darkClass)
    this.savePreference()
  }
  
  loadPreference() {
    const isDark = localStorage.getItem('darkMode') === 'true'
    document.documentElement.classList.toggle(this.darkClass, isDark)
    this.updateToggleButton(isDark)
  }
  
  savePreference() {
    const isDark = document.documentElement.classList.contains(this.darkClass)
    localStorage.setItem('darkMode', isDark)
    this.updateToggleButton(isDark)
  }
  
  updateToggleButton(isDark) {
    this.toggleTarget.setAttribute('aria-checked', isDark)
  }
}
```

## Modal Handling

```javascript
// app/javascript/controllers/modal_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dialog"]
  
  connect() {
    this.boundKeyHandler = this.handleKeyup.bind(this)
    document.addEventListener("keyup", this.boundKeyHandler)
  }
  
  disconnect() {
    document.removeEventListener("keyup", this.boundKeyHandler)
  }
  
  open() {
    this.dialogTarget.showModal()
    this.dialogTarget.setAttribute("aria-modal", "true")
    this.trapFocus()
  }
  
  close() {
    this.dialogTarget.close()
    this.dialogTarget.setAttribute("aria-modal", "false")
  }
  
  handleKeyup(event) {
    if (event.code === "Escape") {
      this.close()
    }
  }
  
  trapFocus() {
    const focusableElements = this.dialogTarget.querySelectorAll(
      'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])'
    )
    
    const firstFocusable = focusableElements[0]
    const lastFocusable = focusableElements[focusableElements.length - 1]
    
    this.dialogTarget.addEventListener('keydown', (e) => {
      if (e.key === 'Tab') {
        if (e.shiftKey) {
          if (document.activeElement === firstFocusable) {
            lastFocusable.focus()
            e.preventDefault()
          }
        } else {
          if (document.activeElement === lastFocusable) {
            firstFocusable.focus()
            e.preventDefault()
          }
        }
      }
    })
    
    firstFocusable.focus()
  }
}
```

## Clipboard Operations

```javascript
// app/javascript/controllers/clipboard_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["source", "button"]
  static values = {
    successDuration: { type: Number, default: 2000 }
  }
  
  copy() {
    navigator.clipboard.writeText(this.sourceTarget.value).then(() => {
      this.showSuccess()
    })
  }
  
  showSuccess() {
    const originalText = this.buttonTarget.textContent
    this.buttonTarget.textContent = "Copied!"
    
    setTimeout(() => {
      this.buttonTarget.textContent = originalText
    }, this.successDurationValue)
  }
}
```

## Infinite Scroll

```javascript
// app/javascript/controllers/infinite_scroll_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["entries", "nextPage"]
  
  connect() {
    this.createObserver()
  }
  
  disconnect() {
    this.observer.disconnect()
  }
  
  createObserver() {
    this.observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          this.loadMore()
        }
      })
    })
    
    if (this.hasNextPageTarget) {
      this.observer.observe(this.nextPageTarget)
    }
  }
  
  loadMore() {
    const nextPageUrl = this.nextPageTarget.getAttribute("data-url")
    if (!nextPageUrl) return
    
    fetch(nextPageUrl, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
  }
}
```

## Best Practices

1. **Controller Organization**:
   - Keep controllers focused and single-purpose
   - Use meaningful names
   - Document complex behaviors

2. **Performance**:
   - Debounce frequent events
   - Clean up event listeners
   - Use values API for configuration

3. **Accessibility**:
   - Manage focus appropriately
   - Use ARIA attributes
   - Support keyboard navigation

4. **Error Handling**:
   - Provide fallbacks
   - Show feedback for async operations
   - Log errors appropriately

5. **State Management**:
   - Use Stimulus values for configuration
   - Persist state when needed
   - Keep state minimal

## Testing

```javascript
// test/javascript/controllers/theme_controller_test.js
import { Application } from "@hotwired/stimulus"
import ThemeController from "controllers/theme_controller"

describe("ThemeController", () => {
  beforeEach(() => {
    document.body.innerHTML = `
      <div data-controller="theme">
        <button data-theme-target="toggle">Toggle Theme</button>
      </div>
    `
    
    const application = Application.start()
    application.register("theme", ThemeController)
  })
  
  it("toggles dark mode", () => {
    const button = document.querySelector("[data-theme-target='toggle']")
    button.click()
    
    expect(document.documentElement.classList.contains("dark")).toBe(true)
  })
})

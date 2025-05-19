import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  static targets = ["sunIcon", "moonIcon"];

  connect() {
    // On initial load, check if dark mode should be applied
    if (localStorage.theme === 'dark' || (!localStorage.theme && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      document.documentElement.classList.add('dark')
    } else {
      document.documentElement.classList.remove('dark')
    }
    this.updateIcons();
    // Add transition classes after initial theme is set
    setTimeout(() => {
      document.documentElement.classList.add('transition-colors', 'duration-200')
    }, 100)
  }

  toggleTheme() {
    // Toggle dark class on html element
    const isDark = document.documentElement.classList.toggle('dark')
    // Save preference to localStorage
    localStorage.theme = isDark ? 'dark' : 'light'
    this.updateIcons();
  }

  updateIcons() {
    const isDark = document.documentElement.classList.contains('dark');
    this.sunIconTargets.forEach(icon => {
      icon.classList.toggle('hidden', !isDark);
      icon.classList.toggle('block', isDark);
    });
    this.moonIconTargets.forEach(icon => {
      icon.classList.toggle('hidden', isDark);
      icon.classList.toggle('block', !isDark);
    });
  }
}

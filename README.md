# Fluxuate

Fluxuate is a modern, responsive workflow and collaboration platform for Enterprise Application Delivery built with Ruby on Rails, Devise, and Tailwind CSS.

## Features

- **Modern, Responsive Layout:**
  - Uses Tailwind CSS for a clean, adaptable design.
  - Layout ensures the footer stays at the bottom of the viewport, even with minimal content.
  - Supports both light and dark themes.

- **Authentication:**
  - User registration, login, and profile editing powered by Devise.
  - Authentication pages (sign in, sign up, password reset) have custom, responsive layouts.
  - Each authentication form can define its own width and appearance.

- **Accessibility:**
  - Color contrast and focus states are tuned for accessibility.
  - Forms and navigation are keyboard-friendly.

- **User Edit Page:**
  - Improved layout for better usability and password verification.

## Getting Started

### Prerequisites

- Ruby 3.x
- Rails 8.x
- Node.js & Yarn (for JS/CSS assets)
- PostgreSQL (or update `config/database.yml` for your DB)

### Setup

```bash
bundle install
yarn install
rails db:setup
```

### Running Locally

```bash
bin/dev
```

This will start both the Rails server and the Tailwind CSS watcher.

Visit [http://localhost:3000](http://localhost:3000) in your browser.

### Customization

- **Authentication Layout:** Edit `app/views/layouts/auth.html.erb`.
- **Application Layout:** Edit `app/views/layouts/application.html.erb`.
- **Devise Views:** Customize forms in `app/views/devise/`.
- **Theme/Colors:** Adjust Tailwind config or use utility classes directly in views.

### Accessibility & UX

- All forms are responsive and accessible.
- Footer and hero sections are visually consistent across devices and themes.
- Buttons and links have improved hover/focus contrast for usability.

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](LICENSE)

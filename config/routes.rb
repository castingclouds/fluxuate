Rails.application.routes.draw do
  # Devise routes
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }

  # Home page
  root to: "home#index"
  get "home/index"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Protected routes (require authentication)
  authenticated :user do
    # Add your authenticated routes here
    # Example: resources :dashboard, only: [:index]
  end
end

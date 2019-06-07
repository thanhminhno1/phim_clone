Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    sessions: 'users/sessions'
  }
  resources :home
  resources :categories
  resources :films
  resources :countries
end

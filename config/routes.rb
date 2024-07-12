Rails.application.routes.draw do
  resources :users
  root 'users#index'
  devise_for :users
  # , controllers: {
  #   registrations: 'users/registrations'
  #   # sessions: 'users/sessions'
  # }
  # Custom routes for user registration
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create', as: 'signup_post'
end

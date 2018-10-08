# frozen_string_literal: true

Rails.application.routes.draw do
  resources :todos do
    resources :items
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  # match 'auth/login', to : 'authentication#authenticate', via: [:post]
  # match 'signup', to 'users#create', via: [:post]
end

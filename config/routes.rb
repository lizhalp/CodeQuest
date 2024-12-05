# frozen_string_literal: true

Rails.application.routes.draw do
  # ----------- Content Management Routes
  resources :courses
  resources :chapters, only: %i[create edit update destroy] do
    resources :lessons, except: %i[index]
  end
  resources :votes, only: %i[create destroy]

  # ----------- Social Routes
  resources :friend_requests, only: %i[create update destroy]
  resources :users, only: %i[new create show destroy] do
    resources :notifications, only: %i[index destroy] do
      patch :mark_as_read, on: :member
    end
  end

  # ----------- Chat Routes
  resources :conversations, only: %i[index show] do
    resources :messages, only: %i[index create]
  end

  # ----------- Home Routes 
  resources :home, only: %i[index]

  # ----------- Authentication Routes
  resource :session
  resources :passwords, param: :token
  get "/auth/:provider/callback", to: "sessions#omniauth"
  delete "/logout", to: "sessions#destroy"

  # ----------- Root Route
  root "courses#index"
  get "up" => "rails/health#show", as: :rails_health_check
end

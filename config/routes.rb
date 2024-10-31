Rails.application.routes.draw do
  resources :users, except: [ :index ]
  resources :topics do
    resources :contents, except: %i[index] do
      member do
        post :view
      end
    end
  end
  resource :session
  resources :votes, only: [ :create ]
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  #

  post "logout" => "sessions#destroy", as: :logout

  get "/auth/:provider/callback", to: "sessions#omniauth"

  # Defines the root path route ("/")
  root to: "topics#index"
end

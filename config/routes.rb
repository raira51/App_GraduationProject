Rails.application.routes.draw do
  get 'sessions/new'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  # entry
  get "/start", to: "starts#show"

  # auth
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get  "/login",  to: "sessions#new"
  post "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # pages
  get "/mypage", to: "mypages#show"

  # celebrations
  resources :celebrations, only: %i[new create edit update] do
    member do
      get :issued
      patch :publish
   end
  end

  #share_url
  get "/celebrations/:share_url", to: "celebrations#show", as: :public_celebration
end

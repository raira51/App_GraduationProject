Rails.application.routes.draw do
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
    # status
    member do
      get :issued
      patch :publish
    end
    # letters
    resources :letters, only: %i[new create edit update destroy]
    # flowers
    resource :bouquet, only: %i[show edit update]
    resources :bouquet_flowers, only: %i[create destroy]
  end

  # share_url(閲覧用)
  get "/celebrations/:share_url", to: "celebrations#show", as: :public_celebration
  # share_url(手紙投稿用)
  get  "/l/:share_url", to: "public_letters#new"
  post "/l/:share_url", to: "public_letters#create"
end

Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "/tarifs", to: "pages#tarifs"
  get "/centre_bien_etre", to: "pages#centre_bien_etre"
  get "/profile", to: "dashboard#user_profile"

  resources :rooms do
    resources :bookings
    resources :reviews
  end

  # Defines the root path route ("/")
  # root "posts#index"
end

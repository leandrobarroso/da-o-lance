Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :bids, only: [:index, :show]

  resources :auctions, only: [:index, :new, :create, :show]

  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: :new
  end
  resources :auctions do
    resources :sellers, except: :index do
      resources :bids
    end
  end
  resources :sellers, only: [:new, :create, :show]
  resources :bids, only: [:show, :edit, :update]
  resources :bid_products

  get '/user' => "sellers#show", :as => :user_root
end


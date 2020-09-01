Rails.application.routes.draw do
  devise_for :users

  resources :auctions, only: [:index]

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :auctions do
    resources :sellers, except: :index do
      resources :bids
    end
  end
  resources :sellers, only: :show
  resources :bids, only: [:show, :edit]
  resources :bid_products
end

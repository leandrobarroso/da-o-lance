Rails.application.routes.draw do
  devise_for :users

  resources :auctions, only: [:index]

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sellers, except: :index
  resources :auctions do
    resources :bids
  end
end

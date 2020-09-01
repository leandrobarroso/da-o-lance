Rails.application.routes.draw do

  devise_for :users

  resources :bids, only: [:index, :show]

  resources :auctions, only: [:index, :new, :create]

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

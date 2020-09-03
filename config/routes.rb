Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :sellers, only: [:new, :create, :show]

  resources :bids, only: [:index, :show, :edit, :update]

  resources :auctions, only: [:index, :new, :create, :show] do
    resources :bids, only: [:new]
  end

  resources :orders, only: [:index, :show]

  get '/user' => "sellers#show", :as => :user_root
end

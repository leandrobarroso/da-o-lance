Rails.application.routes.draw do

  # get "set_pt/:locale", to:"application#set_locale_pt", as: :set_pt
  # get "set_en/:locale", to:"application#set_locale_en", as: :set_en

  scope '(:locale)', locale: /en|pt/ do

    root to: 'pages#home'
    devise_for :users

    resources :sellers, only: [:new, :create, :show]

    resources :bids, only: [:index, :show, :edit, :update]

    resources :auctions, only: [:index, :new, :create, :show] do
      resources :bids, only: [:new]
    end

    resources :orders, only: [:index, :show, :create] do
      resources :payments, only: :new
    end

    get '/user' => "users#show", :as => :user_root

    mount StripeEvent::Engine, at: '/stripe-webhooks'
  end
end

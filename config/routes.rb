Ohmysupport::Engine.routes.draw do
  resources :categories, only: [:show] do
    resources :articles
  end

  resources :tickets, only: [:index, :new, :create]

  root to: 'home#index'
end

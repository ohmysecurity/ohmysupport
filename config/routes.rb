Ohmysupport::Engine.routes.draw do
  resources :categories, only: [:show] do
    resources :articles
  end

  resources :tickets, only: [:index, :show, :new, :create] do
    resources :responses, only: [:create]
  end

  root to: 'home#index'
end

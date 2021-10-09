Ohmysupport::Engine.routes.draw do
  resources :categories, only: [:show] do
    resources :articles, except: [:index, :delete] do
      member do
        patch :toggle
      end
    end
  end

  resources :tickets, only: [:index, :show, :new, :create] do
    resources :responses, only: [:create]
  end

  namespace :staff do
    resources :tickets, only: [:index] do
      member do
        delete :close
      end
    end
  end

  root to: 'home#index'
end

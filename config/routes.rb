Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/signup',  to: 'users#new'

  resources :users, only: [:new, :create, :show] do
    resources :projects, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :projects do
    resources :tasks, only: [:create, :edit, :update, :destroy] do
      member do
        patch 'toggle'
      end

      member do
        patch 'sort'
      end

      member do
        patch 'target_date'
      end

    end
  end
end

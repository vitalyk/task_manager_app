Rails.application.routes.draw do
  root 'static_pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, only: [:show] do
    resources :projects
  end

  resources :projects do
    resources :tasks, only: [:create, :edit, :update, :destroy] do
      member do
        patch 'toggle'
      end
    end
  end
end

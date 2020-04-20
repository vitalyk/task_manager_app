Rails.application.routes.draw do
  resources :projects do
    resources :tasks, only: [:create, :edit, :update, :destroy] do
      member do
        patch 'toggle'
      end
    end
  end
  get  '/todo', to: 'projects#new'
  root 'projects#index'
end

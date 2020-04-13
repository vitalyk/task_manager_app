Rails.application.routes.draw do
  get 'projects/new'
  root 'static_pages#home'
  get  '/home', to: 'static_pages#home'
  get  '/todo', to: 'projects#new'
end

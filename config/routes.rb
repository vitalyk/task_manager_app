Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/home', to: 'static_pages#home'
end

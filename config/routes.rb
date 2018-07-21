Rails.application.routes.draw do
  resources :portfolios

  get 'about', to: 'pages#about'
  get 'contact_admin', to: 'pages#contact'
  resources :blogs

  root to: 'pages#home'
end

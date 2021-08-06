Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'
  get '/reviews', to: 'pages#reviews'
  get '/privacy', to: 'pages#privacy'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/preparation', to: 'pages#preparation'
  resources :safaris
end

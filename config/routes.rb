Rails.application.routes.draw do

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  resources :news_releases
  resources :users
  resources :phones
  resources :contacts
  resources :sessions

  root 'contacts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

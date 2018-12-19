Rails.application.routes.draw do
  resources :sport_sections_users
  resources :tickets_users
  resources :tickets
  devise_for :users
  resources :sport_sections
  root to: 'tickets_users#index'
  post 'tickets/add'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

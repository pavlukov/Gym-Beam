Rails.application.routes.draw do
  resources :sport_sections_users
  resources :tickets_users
  resources :tickets
  resources :sport_sections
  resources :comments
  devise_for :users
  root to: 'tickets_users#index'
  post 'tickets/add'
  get 'tags/:tag', to: 'sport_sections#index', as: :tag
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

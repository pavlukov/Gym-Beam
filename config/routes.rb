Rails.application.routes.draw do
  resources :sport_sections_users
  resources :tickets_users
  resources :tickets
  resources :sport_sections
  resources :comments
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'tickets_users#index'
  post 'tickets/add'
  get 'tags/:tag', to: 'sport_sections#index', as: :tag
  get 'users/unapproved', to: 'users#unapproved_list'
  post 'users/confirm'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

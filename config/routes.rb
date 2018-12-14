Rails.application.routes.draw do
  resources :tickets
  devise_for :users
  resources :sport_sections
  root to: 'tickets#index'
  post 'tickets/add'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

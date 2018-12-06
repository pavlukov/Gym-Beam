Rails.application.routes.draw do
  resources :tickets
  resources :sport_sections
  devise_for :users
  resources :sport_sections
  root to: 'sport_sections#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

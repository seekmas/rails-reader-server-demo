Rails.application.routes.draw do

  devise_for :users
  match 'customers', to: 'customers#index', via: [:options]
  match 'posters', to: 'posters#index', via: [:options]
  resources :customers
  resources :posters

end

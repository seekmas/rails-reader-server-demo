Rails.application.routes.draw do


  resources :posters

  devise_for :users
  match 'customers', to: 'customers#index', via: [:options]
  resources :customers

end

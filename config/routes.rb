Rails.application.routes.draw do
  resources :users_parks
  resources :users
  resources :parks

  post 'users/login', to: 'users#login'
  post 'parks/search', to: 'parks#search'
  post 'parks/homePark', to: 'parks#homePark'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

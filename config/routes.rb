Rails.application.routes.draw do

  resources :matches, only: [:update, :edit]

  get 'matches/show'

  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'

  resources :users, only: [ :show ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :competitions, only: [:index, :new, :create, :show]
end

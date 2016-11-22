Rails.application.routes.draw do


  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'competitions', to: 'competitions#index'
  get 'competitions/new', to: 'competitions#new'
  post 'competitions', to: 'competitions#create'
  get 'competitions/:id', to: 'competitions#show', as: 'competition'
end

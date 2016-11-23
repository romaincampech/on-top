Rails.application.routes.draw do

  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'

  # for chat
  mount ActionCable.server => '/cable'

  resources :users, only: [ :show ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'competitions', to: 'competitions#index'
  # get 'competitions/new', to: 'competitions#new'
  # post 'competitions', to: 'competitions#create'
  # get 'competitions/:id', to: 'competitions#show', as: 'competition'

  resources :competitions, only: [:index, :new, :create, :show, :edit, :update]
  post 'competitions/:id', to: 'messages#create', as: 'new_message'
end

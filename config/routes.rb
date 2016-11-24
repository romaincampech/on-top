Rails.application.routes.draw do


  resources :matches, only: [:update, :edit]

  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'

  resources :users, only: [ :show ] do
    resources :friend_requests, only: [ :create ]
  end
  resources :friendships, only: [ :destroy ]

  # for chat
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :competitions, only: [:index, :new, :create, :show, :edit, :update] do
    resources :messages, only: [:create]
  end

end

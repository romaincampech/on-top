Rails.application.routes.draw do

  resources :matches, only: [:update, :edit, :show]

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  resources :users, only: [ :show ] do
    resources :friend_requests, only: [ :create ]
    get "/infos", to: "users#infos"
    resources :friendships, only: [:index], :path => "friends"
  end
  resources :friend_requests, only: [:update]
  resources :friendships, only: [ :destroy ]

  resources :activities

  # for chat
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :competitions, only: [:index, :new, :create, :show, :edit, :update] do
    resources :messages, only: [:create]
  end

  resources :teams, only: [:new, :create, :show] do
    resources :messages, only: [:create]
  end
end

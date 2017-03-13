Rails.application.routes.draw do

#root: activity feed for logged in users / landing page for logged out users
  # authenticated :user do
  #   root to: 'users#show', as: :authenticated_root
  # end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :matches, only: [:index, :update, :edit, :show]

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount Attachinary::Engine => "/attachinary"

  resources :users, only: [ :show ] do
    resources :friend_requests, only: [ :create ]
    get "/infos", to: "users#infos"
    resources :friendships, only: [:index], :path => "friends"
  end
  resources :friend_requests, only: [:update]
  resources :friendships, only: [ :destroy ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :competitions, only: [:index, :new, :create, :show, :edit, :update] do
    resources :messages, only: [:create]
  end

  resources :teams, only: [:new, :create, :show] do
    resources :messages, only: [:create]
  end

  # Pages
    root to: 'pages#home'
    get 'about', to: 'pages#about'
    get 'start', to: 'pages#start'
    get 'feedbacks', to: 'pages#feedbacks'

  # Direct Messages
    resources :conversations do
      member do
        post :close
      end
      resources :messages
    end

end



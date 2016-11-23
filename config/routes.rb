Rails.application.routes.draw do


  resources :matches, only: [:update, :edit]

  devise_for :users
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'

  # for chat
  mount ActionCable.server => '/cable'

  resources :users, only: [ :show ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :competitions, only: [:index, :new, :create, :show, :edit, :update] do
    resources :messages, only: [:create]
  end

>>>>>>> master
end

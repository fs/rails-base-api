RailsBaseApi::Application.routes.draw do
  # Devise
  #
  scope defaults: { format: :json } do
    devise_for :users, only: []
    devise_scope :user do
      post 'users/sign_in', to: 'sessions#create'
    end
  end

  # Resources require authenticated user
  #
  namespace :user_scope do
    resources :comments, only: [:index, :create]
  end

  # Public resources
  #
  resources :posts, only: [:index, :show]
end

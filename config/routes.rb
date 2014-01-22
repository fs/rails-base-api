RailsBaseApi::Application.routes.draw do
  # Devise
  #
  devise_for :users, only: []

  namespace :api, defaults: {format: 'json'} do
    scope :v1, module: :v1 do
      devise_scope :user do
        post 'users/sign_in', to: 'sessions#create'
      end

      # Resources require authenticated user
      #
      namespace :user do
        resources :comments, only: [:index, :create]
      end

      # Public resources
      #
      resources :posts, only: [:index, :show]
    end
  end

  if defined? ApiTaster::Engine
    mount ApiTaster::Engine => '/api_taster'
    root to: redirect('/api_taster')
  else
    root to: 'posts#index'
  end
end

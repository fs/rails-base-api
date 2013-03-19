Rails3BaseApi::Application.routes.draw do
  devise_for :users, only: []
  devise_scope :user do
    post 'users/sign_in', to: 'sessions#create'
  end

  resources :posts, only: [:index, :show] do
    resources :comments,
      only: [:index],
      controller: :post_comments
  end

  resources :comments, only: [:index, :show]

  root :to => 'comments#index'

  mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
end

ApiTaster::RouteCollector.collect! if defined? ApiTaster::Engine

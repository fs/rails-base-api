Rails3BaseApi::Application.routes.draw do
  resources :posts, only: [:index, :show] do
    resources :comments,
      only: [:index],
      controller: :post_comments
  end

  resources :comments, only: [:index, :show]

  mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
end

ApiTaster::RouteCollector.collect! if defined? ApiTaster::Engine

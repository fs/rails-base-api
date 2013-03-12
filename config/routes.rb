Rails3BaseApi::Application.routes.draw do
  resources :posts, only: [:index]

  mount ApiTaster::Engine => '/api_taster' if defined? ApiTaster::Engine
end

ApiTaster::RouteCollector.collect! if defined? ApiTaster::Engine

Rails.application.routes.draw do
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :users, only: %i(create update show index)
      resources :admins, only: %i(index)
      resources :sessions, only: %i(create)
      resources :articles, only: %i(index)
      get "tokens/refresh", to: "tokens#refresh"
    end
  end
end

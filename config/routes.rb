Rails.application.routes.draw do
  scope defaults: { format: :json } do
    devise_for :users, only: []
  end

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :users, only: %i[create update show index destroy]
      resources :sessions, only: :create
      get "tokens/refresh", to: "tokens#refresh"
    end
  end
end

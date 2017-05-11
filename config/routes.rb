Rails.application.routes.draw do
  scope defaults: { format: :json } do
    devise_for :users, only: []
  end

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      devise_scope :user do
        post "users/sign_in", to: "sessions#create"
        post "sessions", to: "sessions#create"
      end

      resources :users, only: %i[create update show index]
      get "tokens/refresh", to: "tokens#refresh"
    end
  end
end

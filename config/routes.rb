Rails.application.routes.draw do
  namespace :v1, defaults: { format: "json" } do
    resources :tokens, only: :create
    resources :users, only: :create
  end
end

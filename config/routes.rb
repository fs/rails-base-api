Rails.application.routes.draw do
  namespace :v1, defaults: { format: "jsonapi" } do
    resources :tokens, only: :create
    resources :users, only: %i(index show create)
    resource :profile, only: %i(show update destroy)
  end
end

Rails.application.routes.draw do
  namespace :v1, defaults: { format: "jsonapi" } do
    resources :registrations, only: :create
    resources :tokens, only: :create
    resource :profile, only: %i[show update destroy]
    resources :users, only: %i[index show]
  end
end

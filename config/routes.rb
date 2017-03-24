Rails.application.routes.draw do
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
    end
  end
end

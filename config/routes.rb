Rails.application.routes.draw do
  mount_ember_app :frontend, to: "/"

  namespace :api do
    namespace :v1, except: %i(new edit) do
      resources :products
    end
  end
end

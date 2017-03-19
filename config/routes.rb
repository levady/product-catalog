Rails.application.routes.draw do
  namespace :api do
    namespace :v1, except: %i(new edit) do
      resources :products
    end
  end
end

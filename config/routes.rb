Rails.application.routes.draw do
 
  namespace :api do
    namespace :v1 do
      resources :users
      resources :games do
        resources :scores
        resources :ships
      end
    end
  end
end

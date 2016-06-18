Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      resources :user_games
      resources :games
    end
  end
end

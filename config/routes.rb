Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'games/hits_array', to: 'games#hits_array'
      resources :users
      resources :user_games
      resources :games
    end
  end
end

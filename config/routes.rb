Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'games/hits_array', to: 'games#hits_array'
      post 'games/new_game', to: 'games#new_game'
      resources :users
      resources :user_games
      resources :games
    end
  end
end

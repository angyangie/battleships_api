module Api
  module V1
    class GamesController < ApplicationController

      def index
        render json: Game.includes(:user_games, :users, :ships), include: ['user_games', 'users', 'ships']
      end

      def show
        render json: Game.includes(:user_games, :ships, :users).find_by(id: params[:id]), include: ['user_games', 'ships', 'users']
      end

      def hits_array
        player_user_game = UserGame.find_by(id: params[:user_game_id])
        data = HitDeterminator.determine_turn_outcome(params[:player_coords], params[:ai_coords], player_user_game)
        render json: { data: data }
      end

      def new_game
        game = Game.find_by(id: params[:id])
        user1 = User.create(username: "angyangie", first_name: "Angie", last_name: "Ramirez", email: "angie.ramirez12@gmail.com", player_rank: "10", password: "hellothere1")
        user2 = User.create(username: "mykemike", first_name: "Michael", last_name: "Appell", email: "mikeappell@gmail.com", player_rank: "3", password: "hellothere1")
        user_game1 = UserGame.create(user: user1, game: game1)
        user_game2 = UserGame.create(user: user2, game: game1)
        game.save
        render json: game.includes(:user_games, :ships, :users), include: ['user_games', 'ships', 'users']
      end
    end
  end
end
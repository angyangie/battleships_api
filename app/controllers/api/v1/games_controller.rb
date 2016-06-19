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
        current_user_game = UserGame.find_by(id: params[:user_game_id])
        data = HitDeterminator.determine(params[:coords], current_user_game)
        render json: { data: data }
      end
    end
  end
end

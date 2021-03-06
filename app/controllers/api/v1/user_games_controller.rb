module Api
  module V1
    class UserGamesController < ApplicationController

      def index
        render json: UserGame.includes(:user_games, :users, :ships), include: ['user_games', 'users', 'ships']
      end

      def show

        render json: UserGame.includes(:user, :game, :ships).find_by(id: params[:id]), include: ['ships']
      end

      def hits_array
        # binding.pry
        current_user_game = UserGame.find_by(id: params[:id])
        data = HitDeterminator.determine_turn_outcome(params[:player_coords], params[:ai_coords], current_user_game)
        render json: { data: data }
      end
    end
  end
end

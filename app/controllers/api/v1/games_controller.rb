module Api
  module V1
    class GamesController < ApplicationController

      def index
        render json: Game.includes(:user_games, :users, :ships), include: ['user_games', 'users', 'ships']
      end

      def show
        render json: Game.includes(:ships).find_by(id: params[:id]), include: ['ships']
      end

      def hits_array #expect from AJAX: user_game, coordinates
        binding.pry
        current_user_game = UserGame.find_by(id: params[:id])
        data = HitDeterminator.determine(params[:coords], current_user_game)
        render json: { data: data }
      end
    end
  end
end

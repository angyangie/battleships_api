module Api
  module V1
    class GamesController < ApplicationController

      def index
        render json: Game.includes(:scores, :users, :ships), include: ['scores', 'users', 'ships']
      end

      def show
        render json: Game.includes(:ships).find_by(id: params[:id]), include: ['ships']
        # render json: Game.includes(:scores, :users, :ships).find_by(id: params[:id]), include: ['scores', 'users', 'ships']
      end

    end
  end
end

module Api
  module V1
    class GamesController < ApplicationController

      def index
        render json: Game.includes(:scores, :users, :ships), include: ['scores', 'users', 'ships']
      end

    end
  end
end

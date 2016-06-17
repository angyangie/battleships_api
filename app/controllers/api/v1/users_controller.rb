module Api
  module V1
    class UsersController < ApplicationController

      def index
        render json: User.includes(:user_games, :games, :ships), include: ['user_games', 'games', 'ships']
      end

    end
  end
end

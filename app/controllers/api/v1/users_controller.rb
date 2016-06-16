module Api
  module V1
    class UsersController < ApplicationController

      def index
        render json: User.includes(:scores, :games, :ships), include: ['scores', 'games', 'ships']
      end

    end
  end
end

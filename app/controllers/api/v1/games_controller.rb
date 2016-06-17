module Api
  module V1
    class GamesController < ApplicationController

      def index
        render json: Game.includes(:user_games, :users, :ships), include: ['user_games', 'users', 'ships']
      end

      def show
        render json: Game.includes(:ships).find_by(id: params[:id]), include: ['ships']
      end

      def hits_array 33
        @hits = params[:coords]


        #create a route (which will look at all the coordinates, determine whether or not it was a hit, then change the array and save). hit from 0 or a 1 or a 2? 
        #needs to be nested in games.
      end

    end
  end
end

#Do ajax call to route in ember. Second board up. 
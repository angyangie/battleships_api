module Api
  module V1
    class GamesController < ApplicationController

      def index
        render json: Game.includes(:user_games, :users, :ships), include: ['user_games', 'users', 'ships']
      end

      def show
        game = Game.find(1)
        game.completed = 0
        game.user_games.destroy_all
        Ship.destroy_all
        # user_game1 = UserGame.find(1)
        # user_game2 = UserGame.find(2)
        # game.user_games.each do |ug|
        #   user
        #   # ug.ships.destroy_all
        #   ug.generate_random_ships
        # end
        user_game1 = UserGame.create(id: 1, user: User.first, game: game)
        user_game2 = UserGame.create(id: 2, user: User.second, game: game)
        # binding.pry
               # user1 = User.create(username: "angyangie", first_name: "Angie", last_name: "Ramirez", email: "angie.ramirez12@gmail.com", player_rank: "10", password: "hellothere1")
        # user2 = User.create(username: "mykemike", first_name: "Michael", last_name: "Appell", email: "mikeappell@gmail.com", player_rank: "3", password: "hellothere1")
        game.save
        # puts "START"
        # puts Game.includes(:user_games, :ships, :users).find(1).ships
        # puts "END"
        render json: Game.includes(:user_games, :ships, :users).find(1), include: ['user_games', 'ships', 'users']
      end

      def hits_array
        player_user_game = UserGame.find_by(id: params[:user_game_id])
        data = HitDeterminator.determine_turn_outcome(params[:player_coords], params[:ai_coords], player_user_game)
        render json: { data: data }
      end

      def new_game
        # binding.pry
        game = Game.find_by(id: params[:game_id])
        user1 = User.create(username: "angyangie", first_name: "Angie", last_name: "Ramirez", email: "angie.ramirez12@gmail.com", player_rank: "10", password: "hellothere1")
        user2 = User.create(username: "mykemike", first_name: "Michael", last_name: "Appell", email: "mikeappell@gmail.com", player_rank: "3", password: "hellothere1")
        user_game1 = UserGame.create(user: user1, game: game)
        user_game2 = UserGame.create(user: user2, game: game)
        game.save
        render json: Game.includes(:user_games, :ships, :users).find_by(id: params[:game_id]), include: ['user_games', 'ships', 'users']
      end
    end
  end
end
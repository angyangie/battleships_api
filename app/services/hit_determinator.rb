class HitDeterminator
  # def self.determine_turn_outcome(player_coords, player_user_game)
  def self.determine_turn_outcome(player_coords, ai_coords, player_user_game)
    @game_status = false
    opponent_user_game = player_user_game.other_user_game

    ai_board_hits_string = update_user_game_hits(opponent_user_game, player_coords)
    player_board_hits_string = update_user_game_hits(player_user_game, ai_coords)

    data = {
      game_status: @game_status,
      ai_grid: ai_board_hits_string,
      player_grid: player_board_hits_string
    }
  end

  private

  def self.update_user_game_hits(user_game, coords)
    hit = user_game.ships.map(&:coordinates).map{|coord| coord.split(",")}.flatten.include?(coords)
    x, y = coords[0].to_i, coords[1].to_i
    if (user_game.hits[x][y] == 1) || (user_game.hits[x][y] == 2)
      # logic if we want to let user know they already hit that target
    elsif hit
      user_game.hits[x][y] = "2"
      determine_sunk_ship(user_game)
    else 
      user_game.hits[x][y] = "1"
    end
    user_game.save
    user_game.hits.flatten.inject(""){|l,z| "#{l},#{z}"}[1..-1]
  end

  def self.determine_sunk_ship(user_game)
    user_game.ships.each do |ship|
      ship_sunk = ship.coordinates.split(",").all? { |coord| user_game.hits[coord[0].to_i][coord[1].to_i] == "2" }
      if ship_sunk
        ship.coordinates.split(",").each { |coord| user_game.hits[coord[0].to_i][coord[1].to_i] = "3" }
        self.determine_game_over(user_game)
      end
    end
  end

  def self.determine_game_over(user_game)
    game_over = user_game.ships.all? do |ship|
      ship.coordinates.split(",").all? { |coord| user_game.hits[coord[0].to_i][coord[1].to_i] == "3" }
    end
    @game_status = user_game.id if game_over
  end

end
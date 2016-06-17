class HitDetermintor
  def self.determine(coords, current_user_game)
    binding.pry
    opponent_user_game = current_user_game.other_user_game
    opposing_hits = opponent_user_game.hits
    hit = opponent_user_game.ships.map(&:coordinates).flatten.include?(coords)
    grid_target = opposing_hits[coords[0]][coords[1]]

    if (grid_target == 1) || (grid_target == 2)
      message = 0
    elsif hit
      message = 2
      grid_target = 2
    else 
      message = 1
      grid_target = 1
    end

    opponent_user_game.save

    data = {
      message: message,
      grid: opposing_hits
    }
  end
end
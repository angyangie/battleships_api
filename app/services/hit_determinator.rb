class HitDeterminator
  def self.determine(coords, current_user_game)
    opponent_user_game = current_user_game.other_user_game
    hit = opponent_user_game.ships.map(&:coordinates).map{|coord| coord.split(",")}.flatten.include?(coords)
    x, y = coords[0].to_i, coords[1].to_i
    if (opponent_user_game.hits[x][y] == 1) || (opponent_user_game.hits[x][y] == 2)
      message = 0
    elsif hit
      message = 2
      opponent_user_game.hits[x][y] = 2
    else 
      message = 1
      opponent_user_game.hits[x][y] = 1
    end
    opponent_user_game.save

    hits_string = opponent_user_game.hits.flatten.inject(""){|l,z| "#{l},#{z}"}[1..-1]

    data = {
      message: message,
      grid: hits_string
    }
  end
end
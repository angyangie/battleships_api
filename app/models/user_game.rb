class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :ships

  after_create :initialize_hits_array

  def other_user_game
    self.game.user_games.where.not(id: self.id)[0]
  end

  def generate_random_ships
    generate_ship(5, "carrier")
    generate_ship(4, "battleship")
    generate_ship(3, "cruiser")
    generate_ship(3, "cruiser")
    generate_ship(2, "destroyer")
  end

  private

  def initialize_hits_array
    self.hits = 
    [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
    save
  end

  def generate_ship(length, ship_type)
    coords = nil
    loop do
      vertical = rand(2) == 1
      pos_or_neg = [1, -1].sample
      coords = []
      loop do
        first_coord = rand(100).to_s.rjust(2, "0")
        binding.pry
        if is_coord_valid?(first_coord)
          coords << first_coord
          break
        end
      end

      (length - 1).times do
        coord = vertical ? "#{coords.last[0]}#{(coords.last[1].to_i + pos_or_neg)}" : "#{coords.last[0].to_i + pos_or_neg}#{coords.last[1]}"
        coords << coord
        binding.pry
      end

      break if coords.all? { |coord| is_coord_valid?(coord) }
    end
    coords_string = coords.join(",")
    binding.pry
    ship = Ship.create(coordinates: coords_string, ship_type: ship_type, user_game: self, user: self.user)
  end

  def is_coord_valid?(coord)
    binding.pry
    coord.match(/\d\d/) && coord.to_i >= 0 && coord.to_i < 100 && !self.ships.pluck('coordinates').join(",").include?(coord)
  end

end

class AddHitsToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :hits, :string
  end
end

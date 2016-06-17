class AddHitsRemoveScoreFromUserGames < ActiveRecord::Migration[5.0]
  def change
    add_column :user_games, :hits, :string
    remove_column :user_games, :score
  end
end

class ChangeTableNameFromScoresToUserGames < ActiveRecord::Migration[5.0]
  def change
    rename_table :scores, :user_games
  end
end

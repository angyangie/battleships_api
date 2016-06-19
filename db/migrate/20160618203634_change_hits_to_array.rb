class ChangeHitsToArray < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_games, :hits
    add_column :user_games, :hits, :string, array: true
  end
end

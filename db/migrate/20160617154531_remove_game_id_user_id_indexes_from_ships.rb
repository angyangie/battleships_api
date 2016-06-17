class RemoveGameIdUserIdIndexesFromShips < ActiveRecord::Migration[5.0]
  def change
    remove_index :ships, :game_id
    remove_index :ships, :user_id
    remove_column :ships, :game_id
    remove_column :ships, :user_id
    add_reference :ships, :user_game, index: true
  end
end

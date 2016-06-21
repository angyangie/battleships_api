class ChangeCompletedInGames < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :completed
    add_column :games, :completed, :integer, default: 0
  end
end

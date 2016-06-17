class RemoveHitsFromGame < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :hits
  end
end

class RemoveHitsFromShips < ActiveRecord::Migration[5.0]
  def change
    remove_column :ships, :hits
  end
end

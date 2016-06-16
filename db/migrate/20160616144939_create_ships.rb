class CreateShips < ActiveRecord::Migration[5.0]
  def change
    create_table :ships do |t|
      t.string :coordinates
      t.string :hits
      t.string :ship_type
      t.belongs_to :game, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.boolean :completed
      t.integer :winner, default: nil
      t.string :game_type

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :password_digest
      t.boolean :email_confirm
      t.integer :player_rank

      t.timestamps
    end
  end
end

class AddUserToShips < ActiveRecord::Migration[5.0]
  def change
    add_reference :ships, :user, index: true
  end
end

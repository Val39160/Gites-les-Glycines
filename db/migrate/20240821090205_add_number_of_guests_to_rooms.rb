class AddNumberOfGuestsToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :number_of_guests, :integer
  end
end

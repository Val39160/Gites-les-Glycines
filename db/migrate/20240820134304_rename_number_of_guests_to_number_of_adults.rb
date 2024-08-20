class RenameNumberOfGuestsToNumberOfAdults < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :number_of_guests, :number_of_adults
  end
end

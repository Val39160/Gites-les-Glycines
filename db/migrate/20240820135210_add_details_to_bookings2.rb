class AddDetailsToBookings2 < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :civility, :string
  end
end

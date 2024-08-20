class AddDetailsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :first_name, :string
    add_column :bookings, :last_name, :string
    add_column :bookings, :email, :string
    add_column :bookings, :phone_number, :string
    add_column :bookings, :number_of_childs, :integer
  end
end

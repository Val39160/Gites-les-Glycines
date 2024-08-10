class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.integer :number_of_guests
      t.decimal :total_price
      t.string :status
      t.string :payment
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

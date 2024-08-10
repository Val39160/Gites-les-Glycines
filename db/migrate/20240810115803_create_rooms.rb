class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.decimal :price_per_day
      t.decimal :average_rating

      t.timestamps
    end
  end
end

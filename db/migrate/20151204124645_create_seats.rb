class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :seat_id
      t.string :userid
      t.string :status
      t.integer :price

      t.timestamps null: false
    end
  end
end
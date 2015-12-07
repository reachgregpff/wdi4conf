class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :seat_id
      t.string :name
      t.string :status
      t.text :details
      t.integer :price

      t.timestamps null: false
    end
  end
end

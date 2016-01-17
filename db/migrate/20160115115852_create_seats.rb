class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :userid
      t.string :seat_no
      t.string :status
      t.integer :price
      t.string :eggtype
      t.boolean :pendingpayment

      t.timestamps null: false
    end
  end
end

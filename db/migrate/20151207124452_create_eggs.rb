class CreateEggs < ActiveRecord::Migration
  def change
    create_table :eggs do |t|
      t.string :colour
      t.integer :seat
      t.boolean :pendingpayment

      t.timestamps null: false
    end
  end
end

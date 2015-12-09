class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :email
      t.integer :ticket_id

      t.timestamps null: false
    end
  end
end

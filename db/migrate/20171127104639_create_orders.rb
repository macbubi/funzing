class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :tickets
      t.float :total_price
      t.integer :activity_id
      t.integer :user_id

      t.timestamps
    end
  end
end

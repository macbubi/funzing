class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :desc
      t.string :owner
      t.float :price
      t.integer :max_attendies
      t.integer :current_attendies
      t.datetime :date

      t.timestamps
    end
  end
end

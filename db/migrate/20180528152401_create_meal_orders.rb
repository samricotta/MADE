class CreateMealOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_orders do |t|
      t.integer :quantity
      t.references :meal, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end

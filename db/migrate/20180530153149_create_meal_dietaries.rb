class CreateMealDietaries < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_dietaries do |t|
      t.references :meal, foreign_key: true
      t.references :dietary, foreign_key: true

      t.timestamps
    end
  end
end

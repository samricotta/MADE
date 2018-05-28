class CreateMealReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_reviews do |t|
      t.integer :rating
      t.text :comment
      t.integer :speed
      t.integer :quality
      t.integer :portion_size
      t.references :meal, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

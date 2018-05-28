class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.text :ingredients
      t.references :user, foreign_key: true
      t.integer :portions_left
      t.string :photo
      t.string :cuisine
      t.string :dietary

      t.timestamps
    end
  end
end

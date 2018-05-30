class RemoveDietaryFromMeals < ActiveRecord::Migration[5.2]
  def change
    remove_column :meals, :dietary
  end
end

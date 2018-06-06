class AddReadyToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :ready_at, :string
  end
end

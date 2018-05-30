class CreateDietaries < ActiveRecord::Migration[5.2]
  def change
    create_table :dietaries do |t|
      t.string :name

      t.timestamps
    end
  end
end

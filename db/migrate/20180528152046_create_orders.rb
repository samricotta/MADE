class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.time :pick_up_time
      t.date :pick_up_date
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

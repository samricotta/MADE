class SetDefaultStatusInOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :status, :string, :default => false
  end
end

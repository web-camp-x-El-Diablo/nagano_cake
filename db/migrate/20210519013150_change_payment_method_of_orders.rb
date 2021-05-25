class ChangePaymentMethodOfOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :payment_method, :integer, default: 0
  end

  def down
    change_column :orders, :payment_method, :integer, default: false
  end
end

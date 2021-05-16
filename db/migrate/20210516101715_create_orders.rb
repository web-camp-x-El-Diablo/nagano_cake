class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :delivery_postal_code
      t.string :delivery_address
      t.string :delivery_name
      t.integer :delivery_fee
      t.integer :total_payment
      t.integer :payment_method
      t.integer :order_status

      t.timestamps
    end
  end
end

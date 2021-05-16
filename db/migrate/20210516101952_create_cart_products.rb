class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :product_id
      t.integer :customer_id
      t.integer :amount

      t.timestamps
    end
  end
end

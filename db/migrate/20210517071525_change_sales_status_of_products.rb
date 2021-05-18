class ChangeSalesStatusOfProducts < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :sales_status, :boolean, default: true
  end

  def down
    change_column :products, :sales_status, :boolean, default: false
  end
end

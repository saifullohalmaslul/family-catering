class AddDefaultQuantityToOrderDetail < ActiveRecord::Migration[7.0]
  def change
    change_column_default :order_details, :quantity, from: nil, to: 1
  end
end

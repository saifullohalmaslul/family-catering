class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.belongs_to :order
      t.belongs_to :menu

      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end

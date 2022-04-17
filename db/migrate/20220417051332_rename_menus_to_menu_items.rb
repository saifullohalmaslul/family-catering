class RenameMenusToMenuItems < ActiveRecord::Migration[7.0]
  def change
    rename_table :menus, :menu_items
    rename_column :menu_categories, :menu_id, :menu_item_id
    rename_column :order_details, :menu_id, :menu_item_id
  end
end

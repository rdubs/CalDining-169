class AddCompoundIndexToItemsMenus < ActiveRecord::Migration
  def change
    add_index :items_menus, [:item_id, :menu_id], :unique => true
    #add_index :items_menus, [:menu_id, :item_id], :unique => true
  end
end

class CreateJoinTableItemsMenus < ActiveRecord::Migration
  def change
    create_join_table :items, :menus do |t|
      t.references :item
      t.references :menu
    end
  end
end

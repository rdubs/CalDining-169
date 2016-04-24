class AddVegantarianFieldsToItems < ActiveRecord::Migration
  def change
    add_column :items, :vegetarian, :boolean, :default => false
    add_column :items, :vegan, :boolean, :default => false
  end
end

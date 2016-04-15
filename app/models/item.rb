class Item < ActiveRecord::Base
    has_and_belongs_to_many :menus, :join_table => :items_menus
    has_many :images
end

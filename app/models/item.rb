class Item < ActiveRecord::Base
    has_and_belongs_to_many :menus, :join_table => :items_menus
    has_and_belongs_to_many :users, :join_table => :items_users
    has_many :images
end

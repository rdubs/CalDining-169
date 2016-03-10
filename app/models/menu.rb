class Menu < ActiveRecord::Base
    has_and_belongs_to_many :items, :join_table => :items_menus

    def self.meals
        # Meals should technically be coming from the parser/database
        return ['Breakfast', 'Lunch/Brunch', 'Dinner']
    end

    def self.locations
        return ['Crossroads', 'Cafe 3', 'Foothill', 'Clark Kerr']
    end
end

class AddNutritionFieldsToItems < ActiveRecord::Migration
  def change
    add_column :items, :nutrition_available, :boolean
    add_column :items, :calories, :string
    add_column :items, :calories_from_fat, :string
    add_column :items, :total_fat, :string
    add_column :items, :total_fat_percent, :string
    add_column :items, :total_carbohydrates, :string
    add_column :items, :total_carbohydrates_percent, :string
    add_column :items, :saturated_fat, :string
    add_column :items, :saturated_fat_percent, :string
    add_column :items, :dietary_fiber, :string
    add_column :items, :dietary_fiber_percent, :string
    add_column :items, :trans_fat, :string
    add_column :items, :sugars, :string
    add_column :items, :cholesterol, :string
    add_column :items, :cholesterol_percent, :string
    add_column :items, :protein, :string
    add_column :items, :sodium, :string
    add_column :items, :sodium_percent, :string
    add_column :items, :vitamin_c_percent, :string
    add_column :items, :calcium_percent, :string
    add_column :items, :iron_percent, :string
    add_column :items, :allergens, :string
    add_column :items, :ingredients, :string
  end
end

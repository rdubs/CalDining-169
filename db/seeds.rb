# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

milk = Item.find_or_create_by(name: 'Milk')
pizza = Item.find_or_create_by(name: 'Pizza')
bread = Item.find_or_create_by(name: 'Bread')
coffee = Item.find_or_create_by(name: 'Coffee')
crossroads_breakfast = Menu.find_or_create_by(location: 'Crossroads', meal: 'Breakfast')
foothill_dinner = Menu.find_or_create_by(location: 'Foothill', meal: 'Dinner')
crossroads_breakfast.items.delete(Item.all)
foothill_dinner.items.delete(Item.all)
crossroads_breakfast.items << milk
crossroads_breakfast.items << coffee
foothill_dinner.items << pizza
foothill_dinner.items << coffee
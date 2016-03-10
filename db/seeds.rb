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

#crossroads meals 
crossroads_breakfast = Menu.find_or_create_by(location: 'Crossroads', meal: 'Breakfast')
crossroads_lunch = Menu.find_or_create_by(location: 'Crossroads', meal: 'Lunch/Brunch')
crossroads_dinner = Menu.find_or_create_by(location: 'Crossroads', meal: 'Dinner')

#foothill meals
foothill_breakfast = Menu.find_or_create_by(location: 'Foothill', meal: 'Breakfast')
foothill_lunch = Menu.find_or_create_by(location: 'Foothill', meal: 'Lunch/Brunch')
foothill_dinner = Menu.find_or_create_by(location: 'Foothill', meal: 'Dinner')

#Cafe 3 meals
cafe_3_breakfast = Menu.find_or_create_by(location: 'Cafe 3', meal: 'Breakfast')
cafe_3_lunch = Menu.find_or_create_by(location: 'Cafe 3', meal: 'Lunch/Brunch')
cafe_3_dinner = Menu.find_or_create_by(location: 'Cafe 3', meal: 'Dinner')

#Clark Kerr
clark_kerr_breakfast = Menu.find_or_create_by(location: 'Clark Kerr', meal: 'Breakfast')
clark_kerr_lunch = Menu.find_or_create_by(location: 'Clark Kerr', meal: 'Lunch/Brunch')
clark_kerr_dinner = Menu.find_or_create_by(location: 'Clark Kerr', meal: 'Dinner')


crossroads_breakfast.items.delete(Item.all)
crossroads_lunch.items.delete(Item.all)
crossroads_dinner.items.delete(Item.all)

cafe_3_breakfast.items.delete(Item.all)
cafe_3_lunch.items.delete(Item.all)
cafe_3_dinner.items.delete(Item.all)

clark_kerr_breakfast.items.delete(Item.all)
clark_kerr_lunch.items.delete(Item.all)
clark_kerr_dinner.items.delete(Item.all)

foothill_breakfast.items.delete(Item.all)
foothill_lunch.items.delete(Item.all)
foothill_dinner.items.delete(Item.all)

#Items for each location

crossroads_breakfast.items << milk
crossroads_breakfast.items << coffee
foothill_dinner.items << pizza
foothill_dinner.items << coffee
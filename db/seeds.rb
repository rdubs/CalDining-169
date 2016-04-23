# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

milk = Item.find_or_create_by(name: 'Milk', nutrition_available: true)
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
crossroads_lunch.items << pizza
crossroads_lunch.items << milk
crossroads_dinner.items << pizza
crossroads_dinner.items << milk

cafe_3_breakfast.items << milk
cafe_3_breakfast.items << coffee
cafe_3_lunch.items << pizza
cafe_3_lunch.items << milk
cafe_3_dinner.items << bread
cafe_3_dinner.items << milk

foothill_breakfast.items << milk
foothill_breakfast.items << bread
foothill_lunch.items << pizza
foothill_lunch.items << coffee
foothill_dinner.items << coffee
foothill_dinner.items << milk

clark_kerr_breakfast.items << milk
clark_kerr_breakfast.items << coffee
clark_kerr_lunch.items << pizza
clark_kerr_lunch.items << coffee
clark_kerr_dinner.items << bread
clark_kerr_dinner.items << pizza

## CREATING TEST ADMIN USER
#password: ranitdubey
dubey = User.new(email: 'ranit@dubey.com', encrypted_password: '$2a$10$RTKEkAcV6Cd8XogtQupN/OyUaQAcpVOBwA0eoSoMcnXsGqzZ76vii', password: 'ranitdubey', admin: true)
dubey.save

regular = User.new(email: 'regular@user.com', encrypted_password: '$2a$10$RTKEkAcV6Cd8XogtQupN/OyUaQAcpVOBwA0eoSoMcnXsGqzZ76vii', password: 'regularuser', admin: false)
regular.save
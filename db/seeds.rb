# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Crossroads meals 
crossroads_breakfast = Menu.find_or_create_by(location: 'Crossroads', meal: 'Breakfast')
crossroads_lunch = Menu.find_or_create_by(location: 'Crossroads', meal: 'Lunch/Brunch')
crossroads_dinner = Menu.find_or_create_by(location: 'Crossroads', meal: 'Dinner')

# Foothill meals
foothill_breakfast = Menu.find_or_create_by(location: 'Foothill', meal: 'Breakfast')
foothill_lunch = Menu.find_or_create_by(location: 'Foothill', meal: 'Lunch/Brunch')
foothill_dinner = Menu.find_or_create_by(location: 'Foothill', meal: 'Dinner')

# Cafe 3 meals
cafe_3_breakfast = Menu.find_or_create_by(location: 'Cafe 3', meal: 'Breakfast')
cafe_3_lunch = Menu.find_or_create_by(location: 'Cafe 3', meal: 'Lunch/Brunch')
cafe_3_dinner = Menu.find_or_create_by(location: 'Cafe 3', meal: 'Dinner')

# Clark Kerr meals
clark_kerr_breakfast = Menu.find_or_create_by(location: 'Clark Kerr', meal: 'Breakfast')
clark_kerr_lunch = Menu.find_or_create_by(location: 'Clark Kerr', meal: 'Lunch/Brunch')
clark_kerr_dinner = Menu.find_or_create_by(location: 'Clark Kerr', meal: 'Dinner')


worker = ParserWorker.new
worker.perform()

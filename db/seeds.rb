# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json_string = open(url).read
json_hash = JSON.parse(json_string, { symbolize_names: true })

new_arr = json_hash[:drinks]
new_arr.each do |drink|
  Ingredient.create(name: drink[:strIngredient1])
end

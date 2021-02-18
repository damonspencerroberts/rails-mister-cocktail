# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

# create Ingredients
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json_string = open(url).read
json_hash = JSON.parse(json_string, { symbolize_names: true })

new_arr = json_hash[:drinks]

new_arr.each do |drink|
  Ingredient.create(name: drink[:strIngredient1])
end

new_ings = ['Mint', 'Ginger Beer', 'Redbull', 'Tonic']
new_ings.each do |ing|
  Ingredient.create(name: ing)
end

# create Cocktails
init_tails = ['Mojito', 'Moscow Mule', 'White Russian', 'Strawberry Daquiri', 'Gin and Tonic', 'Vodka Redbull']

init_tails.each do |tail|
  Cocktail.create(name: tail)
end

# create doses
# mojito
Dose.create(description: '1.5 Ounces', cocktail_id: 1, ingredient_id: 1)
Dose.create(description: '2 Teaspoons', cocktail_id: 1, ingredient_id: 25)
Dose.create(description: 'A Little Bit', cocktail_id: 1, ingredient_id: 33)
Dose.create(description: '1 Ounce', cocktail_id: 1, ingredient_id: 30)
Dose.create(description: '6 Leaves', cocktail_id: 1, ingredient_id: 101)
# mule
Dose.create(description: '1.5 Ounces', cocktail_id: 2, ingredient_id: 22)
Dose.create(description: '4 Ounces', cocktail_id: 2, ingredient_id: 30)
Dose.create(description: '0.5 Ounces', cocktail_id: 2, ingredient_id: 1)
# white russian
Dose.create(description: '1.67 Ounces', cocktail_id: 3, ingredient_id: 22)
Dose.create(description: '1 Ounce', cocktail_id: 3, ingredient_id: 64)
Dose.create(description: '0.67 Ounces', cocktail_id: 3, ingredient_id: 19)
# Strawberry Daquiri
Dose.create(description: '500 grams', cocktail_id: 4, ingredient_id: 51)
Dose.create(description: '1/2 Lime', cocktail_id: 4, ingredient_id: 56)
Dose.create(description: '100 ml', cocktail_id: 4, ingredient_id: 1)
# gin tonic
Dose.create(description: '2 Ounces', cocktail_id: 5, ingredient_id: 2)
Dose.create(description: '6 Ounces', cocktail_id: 5, ingredient_id: 104)
# vodka Redbull
Dose.create(description: '2 Ounces', cocktail_id: 6, ingredient_id: 22)
Dose.create(description: '1 Can', cocktail_id: 6, ingredient_id: 103)

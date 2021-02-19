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

# new_arr.each_with_index do |each, index|
#   puts [each, index + 1]
# end

new_arr.each do |drink|
  Ingredient.create(name: drink[:strIngredient1])
end

new_ings = ['Mint', 'Ginger Beer', 'Redbull', 'Tonic', 'Ice', 'Campari', 'Olive']
new_ings.each do |ing|
  Ingredient.create(name: ing)
end

# create Cocktails
image_urls = [
  'https://res.cloudinary.com/dc1w9349i/image/upload/v1613736713/mister-cocktail/mojito_hgld1t.jpg',
  'https://res.cloudinary.com/dc1w9349i/image/upload/v1613736721/mister-cocktail/moscow_mule_z8wl8h.jpg',
  'https://res.cloudinary.com/dc1w9349i/image/upload/v1613736749/mister-cocktail/white_russian_ig8zbt.jpg',
  'https://res.cloudinary.com/dc1w9349i/image/upload/v1613736734/mister-cocktail/strawberry_daqu_qulrui.jpg',
  'https://res.cloudinary.com/dc1w9349i/image/upload/v1613736695/mister-cocktail/gin_tonic_l2vfbn.jpg',
  'https://res.cloudinary.com/dc1w9349i/image/upload/v1613736742/mister-cocktail/vodka_redbull_pw1w02.jpg',
  'https://res.cloudinary.com/dc1w9349i/image/upload/v1613737704/mister-cocktail/old_fashioned_dggjro.jpg',
  'https://res.cloudinary.com/dc1w9349i/image/upload/v1613737704/mister-cocktail/negroni_xmtdoc.jpg',
  'https://res.cloudinary.com/dc1w9349i/image/upload/v1613737704/mister-cocktail/dry_martini_e9kzhd.jpg'
]

new_image_url_files = image_urls.map do |url|
  URI.open(url)
end

p new_image_url_files

init_tails = [
  'Mojito',
  'Moscow Mule',
  'White Russian',
  'Strawberry Daquiri',
  'Gin and Tonic',
  'Vodka Redbull',
  'Old Fashioned',
  'Negroni',
  'Dry Martini'
]

# add images here
init_tails.each_with_index do |tail, index|
  name_file = "#{tail.split(' ').join('_')}.jpeg"
  new_cocktail = Cocktail.new(name: tail)
  new_cocktail.photo.attach(io: new_image_url_files[index], filename: name_file, content_type: 'image/jpg')
  new_cocktail.save
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
Dose.create(description: '500 Grams', cocktail_id: 4, ingredient_id: 51)
Dose.create(description: '1/2 Lime', cocktail_id: 4, ingredient_id: 56)
Dose.create(description: '100 Ml', cocktail_id: 4, ingredient_id: 1)
# gin tonic
Dose.create(description: '2 Ounces', cocktail_id: 5, ingredient_id: 3)
Dose.create(description: '6 Ounces', cocktail_id: 5, ingredient_id: 104)
# vodka Redbull
Dose.create(description: '2 Ounces', cocktail_id: 6, ingredient_id: 22)
Dose.create(description: '1 Can', cocktail_id: 6, ingredient_id: 103)
# old fashioned
Dose.create(description: '2 Ounces', cocktail_id: 7, ingredient_id: 20)
Dose.create(description: '1 Cube', cocktail_id: 7, ingredient_id: 25)
Dose.create(description: '1 Ounce', cocktail_id: 7, ingredient_id: 11)
Dose.create(description: '1 Cube', cocktail_id: 7, ingredient_id: 105)
# negroni
Dose.create(description: '1 Ounce', cocktail_id: 8, ingredient_id: 3)
Dose.create(description: '1 Ounce', cocktail_id: 8, ingredient_id: 15)
Dose.create(description: '2 Ounces', cocktail_id: 8, ingredient_id: 106)

# dry martini
Dose.create(description: '1 Ounce', cocktail_id: 9, ingredient_id: 3)
Dose.create(description: '1 Ounce', cocktail_id: 9, ingredient_id: 15)
Dose.create(description: '1 Portion', cocktail_id: 9, ingredient_id: 107)

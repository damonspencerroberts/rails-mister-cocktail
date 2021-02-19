class AddCocktailsToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :cocktail, null: false, foreign_key: true
  end
end

class Review < ApplicationRecord
  belongs_to :cocktail

  validates :content, :rating, :name, presence: true
  validates :rating, inclusion: 0..5
  validates :rating, numericality: { only_integer: true }
end

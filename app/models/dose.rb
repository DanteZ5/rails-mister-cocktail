class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :ingredient, presence: true, uniqueness: { scope: :cocktail, message: "ingredient already exist" }
  # validates :cocktail, presence: true
  # validates :cokctail_id, :ingredient_id, uniqueness: true

  # A dose must have a description, a cocktail and an ingredient,
  # and [cocktail, ingredient] pairings should be unique.
end

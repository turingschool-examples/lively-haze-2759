class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def unique_ingredients
    Ingredient.joins(dishes: :chef).where(chefs: { id: }).distinct
  end
end

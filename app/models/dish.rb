class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def add_ingredient(ingredient_id)
    ingredients << Ingredient.find(ingredient_id)
  end
end
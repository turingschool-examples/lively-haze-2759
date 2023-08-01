class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_and_belongs_to_many :ingredients

  def total_calories
    ingredients.sum(:calories)
  end 

  def self.create_dish_ingredient(dish_id, ingredient_params)
    dish = find(dish_id)
    ingredient = Ingredient.new(ingredient_params)

    if ingredient.save
      dish.ingredients << ingredient
      return ingredient
    else
      return nil
    end
  end
end
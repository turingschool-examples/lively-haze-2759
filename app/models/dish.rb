class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dishes_ingredients
  has_many :ingredients, through: :dishes_ingredients

  def calorie_count
    ingredients.sum(:calories)
  end

  def add_ingredient(ingredient_id)
    if Ingredient.exists?(ingredient_id)
      ingredient = Ingredient.find(ingredient_id)
      if ingredients.include?(ingredient)
        { success: false, message: 'This ingredient is already included in the dish' }
      else
        ingredients << ingredient
        { success: save, message: 'Ingredient added successfully' }
      end
    else
      { success: false, message: 'This ingredient does not exist' }
    end
  end
end

class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes
   has_many :ingredients, through: :dishes

   def distinct_ingredients
    ingredients.distinct
   end

   def top_ingredients
    ingredients
      .joins(:dish_ingredients)
      .group('ingredients.id')
      .order('COUNT(dish_ingredients.id) DESC')
      .limit(3)
  end
end
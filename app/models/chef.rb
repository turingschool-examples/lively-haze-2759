class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes


   def ingredient_lister
      all_ingredients = []
      dishes.each do |dish|
         dish.ingredients.each do |ingredient|
            all_ingredients << ingredient.name
         end
      end
      all_ingredients
   end
end
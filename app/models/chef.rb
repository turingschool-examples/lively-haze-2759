class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes

   def three_most_popular_ingredients
      dishes.joins(:ingredients)
            .select('ingredients.name')
            .group('ingredients.id')
            .order('COUNT(dishes.id) DESC')
            .limit(3)
   end
end

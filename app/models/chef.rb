class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes

   def ingredient_list
      dishes.joins(:ingredients)
      .select("ingredients.*, ingredients.name")
      .order("ingredients.id")
      .distinct
   end
end
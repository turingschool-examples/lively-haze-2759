class Chef < ApplicationRecord
   validates_presence_of :name
   
   has_many :dishes
   has_many :ingredients, through: :dishes


   def ingredient_names
      ingredients.select(:name)
      .distinct
      .pluck(:name)
   end

   def top_3_ingredients
      Ingredient.joins(:dishes)
         .where(dishes: { chef_id: id })
         .group(:id)
         .order('COUNT(dishes.id) DESC')
         .limit(3)
         .pluck(:name)
    end
end
class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes

   def unique_ingredients
      Ingredient.joins(dishes: :chef).where(chef: {id: self.id}).distinct.order(:name).pluck(:name)
   end
end
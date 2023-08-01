class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes

      def unique_ingredients
        dishes.joins(:ingredients).distinct.pluck(:name)
      end
    
      def most_popular_ingredients(limit = 3)
        Ingredient.joins(:dishes).where(dishes: { chef_id: id }).group(:id).order('COUNT(dishes.id) DESC').limit(limit)
      end
    end
    

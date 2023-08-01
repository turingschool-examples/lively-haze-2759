require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :ingredients}
  end

  describe "instance methods" do
    it "can add an ingredient to a dish" do
      chef_1 = Chef.create!(name: "Goku")

      dish_1 = chef_1.dishes.create!(name: "Tuna", description: "Doesn't taste like chicken")
  
      ingredients_1 = dish_1.ingredients.create!(name: "mayo", calories: 500)
      ingredients_2 = Ingredient.create!(name: "Pickles", calories: 100)
  
      # dish_ingredients_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredients_1.id)

      dish_1.add_ingredient(ingredients_2.id)
      expect(dish_1.ingredients).to eq([ingredients_1, ingredients_2])
    end
  end
end
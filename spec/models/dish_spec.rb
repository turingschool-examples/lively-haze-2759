require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it { should validate_presence_of :name } 
      it { should validate_presence_of :description }
  end

  describe "relationships" do
      it { should belong_to :chef } 
      it { should have_many :dish_ingredients }
      it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "instance methods" do
    chef_1 = Chef.create!(name: "andi")
    chef_2 = Chef.create!(name: "seth")
    dish_1 = chef_1.dishes.create!(name: "gumbo", description: "seafood") 
    dish_2 = chef_2.dishes.create!(name: "bread", description: "flour") 
    ingredient_1 = Ingredient.create!(name: "shrimp", calories: 100) 
    ingredient_2 = Ingredient.create!(name: "sugar", calories: 100) 
    dish_ingredient_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id) 

    it "#calorie_count" do
      expect(dish_1.total_calorie).to eq(100)
    end
  end
end
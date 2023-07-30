require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
      it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "#total_calorie_count" do
    it "calculates the total calories for a given dish" do
      chef = Chef.create!(name: "Gordon Ramsey")
      dish = chef.dishes.create!(name: "Tasty Dish", description: "Very Tasty")

      ingredient_1 = Ingredient.create!(name: "pasta", calories: 200)
      ingredient_2 = Ingredient.create!(name: "chicken", calories: 100)
      ingredient_3 = Ingredient.create!(name: "pesto", calories: 100)

      dish.ingredients << ingredient_1
      dish.ingredients << ingredient_2
      dish.ingredients << ingredient_3

      expect(dish.total_calorie_count).to eq(400)
    end
  end
end
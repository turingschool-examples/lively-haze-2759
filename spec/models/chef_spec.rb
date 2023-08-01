require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
      it {should have_many :ingredients}
  end

  describe "#distinct_ingredients" do
    it "returns list of ingredients used, with no duplicates" do
      @fred = Chef.create!(name: "Fred Tasty")
      @alfredo = @fred.dishes.create!(name: "Shrimp Alfredo", description: "Linguine pasta, alfredo sauce, and garlic shrimp")
      @linguine = @alfredo.ingredients.create!(name: "Linguine Noodles", calories: 200)
      shrimp = @alfredo.ingredients.create!(name: "Shrimp", calories: 85)
      @garlic = @alfredo.ingredients.create!(name: "Garlic", calories: 10)
      @butter = @alfredo.ingredients.create!(name: "Butter", calories: 30)
      heavy_cream = @alfredo.ingredients.create!(name: "Heavy Cream", calories: 100)
      cheese = @alfredo.ingredients.create!(name: "Parmesan Cheese", calories: 20)
      parsley = @alfredo.ingredients.create!(name: "Parsley", calories: 5)
      @lemon = @fred.dishes.create!(name: "Lemon Garlic Pasta", description: "Linguine pasta with lemon garlic sauce")
      just_lemon = @lemon.ingredients.create!(name: "Lemon", calories: 15)
      DishIngredient.create!(dish: @lemon, ingredient: @linguine)
      DishIngredient.create!(dish: @lemon, ingredient: @garlic)
      DishIngredient.create!(dish: @lemon, ingredient: @butter)
      pepper = @lemon.ingredients.create!(name: "Red Pepper", calories: 10)
      oil = @lemon.ingredients.create!(name: "Olive Oil", calories: 50)

      expect(@fred.distinct_ingredients).to include(oil, shrimp, cheese, pepper, @garlic, parsley, just_lemon, @linguine, heavy_cream, @butter)
      expect(@fred.distinct_ingredients.count).to eq(10)
    end
  end

end
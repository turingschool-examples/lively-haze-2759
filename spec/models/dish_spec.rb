require 'rails_helper'

RSpec.describe Dish, type: :model do
  before do
    @fred = Chef.create!(name: "Fred Tasty")
    @alfredo = @fred.dishes.create!(name: "Shrimp Alfredo", description: "Linguine pasta, alfredo sauce, and garlic shrimp")
    @alfredo.ingredients.create!(name: "Linguine Noodles", calories: 200)
    @alfredo.ingredients.create!(name: "Shrimp", calories: 85)
    @alfredo.ingredients.create!(name: "Garlic", calories: 10)
    @alfredo.ingredients.create!(name: "Butter", calories: 30)
    @alfredo.ingredients.create!(name: "Heavy Cream", calories: 100)
    @alfredo.ingredients.create!(name: "Parmesan Cheese", calories: 20)
  end

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
      it {should have_many :ingredients}
  end

  describe "#total_calories" do
    it "totals the calories of all ingredients in the dish" do
      expect(@alfredo.total_calories).to eq(445)
    end
  end

end
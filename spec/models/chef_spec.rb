require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
  end

  describe "instance methods" do
    describe "#unique_ingredients" do
      it "returns a list of unique ingredients" do
        chef = Chef.create!(name: "Chef Bob")
        ingredient1 = Ingredient.create!(name: "Cheese", calories: 100)
        ingredient2 = Ingredient.create!(name: "Macaroni", calories: 200)
        dish1 = Dish.create!(name: "Mac and Cheese", description: "Cheesy goodness", chef_id: chef.id)
        dish1.ingredients << ingredient1
        dish1.ingredients << ingredient1
        dish1.ingredients << ingredient2

        expect(chef.unique_ingredients).to eq([ingredient1, ingredient2])
      end
    end
  end
end

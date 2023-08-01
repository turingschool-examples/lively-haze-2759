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

  describe "instance methods" do
    describe "#total_calories" do
      it "can calculate the total calories for a dish" do
        chef = Chef.create!(name: "Chef")
        dish = Dish.create!(name: "Spaghetti", description: "Delicious", chef: chef)
        dish.ingredients.create!(name: "Spaghetti", calories: 100)
        dish.ingredients.create!(name: "Sauce", calories: 50)

        expect(dish.total_calories).to eq(150)
      end
    end
  end
end

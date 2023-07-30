require 'rails_helper'

RSpec.describe Dish, type: :model do
  before(:each) do
    @chef = Chef.create!(name: "Jean Francois Meteigner")
    @dish = @chef.dishes.create!(name: "Filet Mignon", description: "A tender and expensive cut of beef", chef_id: @chef)
    
    @ingredient_1 = @dish.ingredients.create!(name: "USDA Prime Beef Filet Mignon", calories: 227)
    @ingredient_2 = @dish.ingredients.create!(name: "Kosher Salt", calories: 1)
    @ingredient_3 = @dish.ingredients.create!(name: "Vegetable Oil", calories: 119)
  end

  describe "validations" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:description) }
  end

  describe "relationships" do
      it { should belong_to(:chef) }
      it { should have_many(:dish_ingredients) }
      it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "#instance_methods" do
    describe "#total_calories" do
      it "can find the total calories for the dish" do
        expect(@dish.total_calories).to eq(347)
      end
    end
  end
end
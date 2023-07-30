require 'rails_helper'

RSpec.describe Chef, type: :model do
  before(:each) do
    @chef = Chef.create!(name: "Jean Francois Meteigner")
    @dish = @chef.dishes.create!(name: "Filet Mignon", description: "A tender and expensive cut of beef", chef_id: @chef)
    
    @ingredient_1 = @dish.ingredients.create!(name: "USDA Prime Beef Filet Mignon", calories: 227)
    @ingredient_2 = @dish.ingredients.create!(name: "Kosher Salt", calories: 1)
    @ingredient_3 = @dish.ingredients.create!(name: "Vegetable Oil", calories: 119)
    # add salt and pepper to tast
    @ingredient_4 = @dish.ingredients.create!(name: "Kosher Salt", calories: 1)
    @ingredient_5 = @dish.ingredients.create!(name: "Pepper", calories: 0)
  end

  describe "validations" do
      it { should validate_presence_of(:name) }
  end

  describe "relationships" do
      it { should have_many(:dishes) }
      it { should have_many(:ingredients).through(:dishes) }
  end

  describe "#instance_methods" do
    describe "#ingredient_names" do
      it "can create a list of unique ingredient names" do
        expect(@chef.ingredient_names).to eq([@ingredient_1.name, @ingredient_2.name, @ingredient_3.name])
      end
    end
  end
end
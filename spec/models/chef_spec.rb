require 'rails_helper'

RSpec.describe Chef, type: :model do
  before(:each) do
    @chef = Chef.create!(name: "Jean Francois Meteigner")
    @dish = @chef.dishes.create!(name: "Filet Mignon", description: "A tender and expensive cut of beef", chef_id: @chef)
    
    @ingredient_1 = @dish.ingredients.create!(name: "USDA Prime Beef Filet Mignon", calories: 227)
    @ingredient_2 = @dish.ingredients.create!(name: "Kosher Salt", calories: 1)
    @ingredient_3 = @dish.ingredients.create!(name: "Vegetable Oil", calories: 119)
    @ingredient_4 = @dish.ingredients.create!(name: "Kosher Salt", calories: 1)
    @ingredient_5 = @dish.ingredients.create!(name: "Pepper", calories: 0)

    ## User Story Extension
    @dish_2 = @chef.dishes.create!(name: "Chicken Alfredo", description: "Creamy pasta dish with grilled chicken")
    @dish_3 = @chef.dishes.create!(name: "Caesar Salad", description: "Classic salad with romaine lettuce")

    @ingredient_6 = @dish_2.ingredients.create!(name: "Chicken Breast", calories: 165)
    @ingredient_7 = @dish_3.ingredients.create!(name: "Romaine Lettuce", calories: 8)
    @ingredient_8 = @dish_3.ingredients.create!(name: "Parmesan Cheese", calories: 122)
    @ingredient_9 = @dish_3.ingredients.create!(name: "Croutons", calories: 122)

    @salt = Ingredient.create!(name: "Kosher Salt", calories: 0)
    @pepper = Ingredient.create!(name: "Pepper", calories: 3)
    @cheese = Ingredient.create!(name: "Cheese", calories: 25)
    @dish.ingredients << @cheese
    @dish_2.ingredients << @pepper
    @dish_2.ingredients << @salt
    @dish_2.ingredients << @cheese
    @dish_3.ingredients << @pepper
    @dish_3.ingredients << @salt
    @dish_3.ingredients << @cheese
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
        expect(@chef.ingredient_names.sort).to eq(["Cheese", "Chicken Breast", "Croutons", "Kosher Salt", "Parmesan Cheese", "Pepper", "Romaine Lettuce", "USDA Prime Beef Filet Mignon", "Vegetable Oil"].sort)
      end
    end

    describe "#top_3_ingredients" do
      it "can list the top three ingredients based on the number of dishes they are found in" do
        expect(@chef.top_3_ingredients).to eq(["Cheese", "Pepper", "Kosher Salt"])
      end
    end
  end
end
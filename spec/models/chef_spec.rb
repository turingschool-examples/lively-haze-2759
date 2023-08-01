require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
  end

  describe "#unique_ingredients" do
    it "lists the unique ingredients the chef uses" do
      @chef_1 = Chef.create!(name: "Gordon")
      @dish_1 = Dish.create!(name: "Lasagna", description: "This is a lasagna", chef: @chef_1)
      @dish_2 = Dish.create!(name: "Basically a Lasagna", description: "This is a basically a lasagna", chef: @chef_1)
      @ingredient_1 = Ingredient.create!(name: "Tomato", calories: 10)
      @ingredient_2 = Ingredient.create!(name: "Meat", calories: 20)
      @ingredient_3 = Ingredient.create!(name: "Noodles", calories: 30)

      @dish_1.ingredients << @ingredient_1
      @dish_1.ingredients << @ingredient_2
      @dish_1.ingredients << @ingredient_3

      @dish_2.ingredients << @ingredient_1
      @dish_2.ingredients << @ingredient_2
      @dish_2.ingredients << @ingredient_3

      expect(@chef_1.unique_ingredients).to eq([@ingredient_1.name, @ingredient_2.name, @ingredient_3.name])
    end
  end

end
require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it { should have_many(:dish_ingredients) }
      it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "total_calories" do
    it "adds up all the calories in a dish" do
      @chef_1 = Chef.create!(name: "Gordon")
      @dish_1 = Dish.create!(name: "Lasagna", description: "This is a lasagna", chef: @chef_1)
      @ingredient_1 = Ingredient.create!(name: "Tomato", calories: 10)
      @ingredient_2 = Ingredient.create!(name: "Meat", calories: 20)
      @ingredient_3 = Ingredient.create!(name: "Noodles", calories: 30)
      @dish_1.ingredients << @ingredient_1
      @dish_1.ingredients << @ingredient_2
      @dish_1.ingredients << @ingredient_3

      expect(@dish_1.total_calories).to eq(60)
    end
  end

end
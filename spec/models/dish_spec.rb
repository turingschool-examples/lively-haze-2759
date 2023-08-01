require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
  end

  describe "#Dish Statistics" do
    before do
      @chef = Chef.create!(name: "King Charles")
      @dish = Dish.create!(name: "Pizza", description: "the good good", chef: @chef)
      @dough = Ingredient.create!(name: "Dough", calories: 420)
      @sauce = Ingredient.create!(name: "Sauce", calories: 142)
      @cheese = Ingredient.create!(name: "Cheese", calories: 69)
      @jalepeno = Ingredient.create!(name: "Jalepenos", calories: 12)
      DishIngredient.create!(dish: @dish, ingredient: @dough)
      DishIngredient.create!(dish: @dish, ingredient: @sauce)
      DishIngredient.create!(dish: @dish, ingredient: @cheese)
    end

    describe "#total_calories" do
      it "returns dish's total calories" do
        expect(@dish.total_calories).to eq(420 + 142 + 69)
      end
    end

    describe "#available_ingredients" do
      it "returns created ingredient's not currently in" do
        expect(@dish.available_ingredients).to eq([[@jalepeno.name, @jalepeno.id]])
      end
    end
  end
end
require 'rails_helper'

RSpec.describe "The Chefs Show Page" do
  before(:each) do
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

  it "shows a link to view this chef's ingredients" do
    visit chefs_path(@chef)
    expect(page).to have_link("Ingredients", href: chef_ingredients_path(@chef))
  end
end
require 'rails_helper'

RSpec.describe "The Dish Show Page" do
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

  # User Story 1
  it 'shows the dish name and description' do
    visit dishes_path(@dish)
    # save_and_open_page
    expect(page).to have_content("Pizza")
    expect(page).to have_content("the good good")
  end

  # User Story 1
  it 'shows the dish ingredients' do
    visit dishes_path(@dish)
    expect(page).to have_content("Dough")
    expect(page).to have_content("Sauce")
    expect(page).to have_content("Cheese")
  end

  # User Story 1
  it 'shows the total calories of the dish' do
    visit dishes_path(@dish)
    expect(page).to have_content("Total: 631 calories")
  end

  # User Story 1
  it 'shows the chefs name' do
    visit dishes_path(@dish)
    expect(page).to have_content("Chef: King Charles")
  end

  # User Story 2
  it 'has a form to add an existing ingredient to the dish' do
    visit dishes_path(@dish)
    expect(page).to have_button("Add Ingredient")
    expect(page).to have_content("Dough 420 Sauce 142 Cheese 69 Total: 631 calories")
    click_button "Add Ingredient"
    expect(current_path).to eq(dishes_path(@dish))
    expect(page).to have_content("Dough 420 Sauce 142 Cheese 69 Jalepenos 12 Total: 643 calories")
    # save_and_open_page
  end
end
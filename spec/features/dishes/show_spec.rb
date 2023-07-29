require "rails_helper"

RSpec.describe "Dish show page" do
  before do
    @fred = Chef.create!(name: "Fred Tasty")
    @alfredo = chef.dishes.create!(name: "Shrimp Alfredo", description: "Linguine pasta, alfredo sauce, and garlic shrimp")
    alfredo.ingredients.create!(name: "Linguine Noodles", calories: 200)
    alfredo.ingredients.create!(name: "Shrimp", calories: 85)
    alfredo.ingredients.create!(name: "Garlic", calories: 10)
    alfredo.ingredients.create!(name: "Butter", calories: 30)
    alfredo.ingredients.create!(name: "Heavy Cream", calories: 100)
    alfredo.ingredients.create!(name: "Parmesan Cheese", calories: 20)
    alfredo.ingredients.create!(name: "Parsley", calories: 5)
  end
  
  #User story 1
  it "displays the dish's name and description" do
    visit dish_path(@alfredo)

    expect(page).to have_content("Shrimp Alfredo")
    expect(page).to have_content("Linguine pasta, alfredo sauce, and garlic shrimp")
  end

  it "has a list of ingredients for the dish" do
    visit dish_path(@alfredo)

    expect(page).to have_content("Linguine Noodles")
    expect(page).to have_content("Shrimp")
    expect(page).to have_content("Garlic")
    expect(page).to have_content("Butter")
    expect(page).to have_content("Heavy Cream")
    expect(page).to have_content("Parmesan Cheese")
    expect(page).to have_content("Parsley")
  end

  it "has a total calorie count for the dish" do
    visit dish_path(@alfredo)

    expect(page).to have_content("Calories: 450")
  end

  it "has the chef's name" do
    visit dish_path(@alfredo)

    expect(page).to have_content("Chef: Fred Tasty")
  end
end
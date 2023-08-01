require "rails_helper" 

RSpec.describe "Chef's Ingredients Index Page" do
  before do
    @fred = Chef.create!(name: "Fred Tasty")
    @alfredo = @fred.dishes.create!(name: "Shrimp Alfredo", description: "Linguine pasta, alfredo sauce, and garlic shrimp")
    @linguine = @alfredo.ingredients.create!(name: "Linguine Noodles", calories: 200)
    @alfredo.ingredients.create!(name: "Shrimp", calories: 85)
    @garlic = @alfredo.ingredients.create!(name: "Garlic", calories: 10)
    @butter = @alfredo.ingredients.create!(name: "Butter", calories: 30)
    @alfredo.ingredients.create!(name: "Heavy Cream", calories: 100)
    @alfredo.ingredients.create!(name: "Parmesan Cheese", calories: 20)
    @alfredo.ingredients.create!(name: "Parsley", calories: 5)
    @lemon = @fred.dishes.create!(name: "Lemon Garlic Pasta", description: "Linguine pasta with lemon garlic sauce")
    @lemon.ingredients.create!(name: "Lemon", calories: 15)
    DishIngredient.create!(dish: @lemon, ingredient: @linguine)
    DishIngredient.create!(dish: @lemon, ingredient: @garlic)
    DishIngredient.create!(dish: @lemon, ingredient: @butter)
    @lemon.ingredients.create!(name: "Red Pepper", calories: 10)
    @lemon.ingredients.create!(name: "Olive Oil", calories: 50)
  end

  #User story 3, part 2
  it "has a unique list of ingredients this chef uses" do
    visit chef_path(@fred)
    click_link("Click To View Ingredients This Chef Uses")
    expect(current_path).to eq(chef_ingredients_path(@fred))

    expect(page).to have_content("Linguine Noodles", count: 1)
    expect(page).to have_content("Shrimp", count: 1)
    expect(page).to have_content("Garlic", count: 1)
    expect(page).to have_content("Butter", count: 1)
    expect(page).to have_content("Heavy Cream", count: 1)
    expect(page).to have_content("Parmesan Cheese", count: 1)
    expect(page).to have_content("Parsley", count: 1)
    expect(page).to have_content("Lemon", count: 1)
    expect(page).to have_content("Red Pepper", count: 1)
    expect(page).to have_content("Olive Oil", count: 1)
  end
end
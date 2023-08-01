require "rails_helper"

RSpec.describe "Dish show page" do
  before do
    @wakako = Chef.create!(name: "Wakako Okada")
    @ramen = @wakako.dishes.create!(name: "Ramen", description: "A comforting and easy to make ramen!")
    @ramen.ingredients.create!(name: "Chicken Breasts", calories: 231)
    @ramen.ingredients.create!(name: "Ginger", calories: 9)
    @ramen.ingredients.create!(name: "Garlic", calories: 5)
    @ramen.ingredients.create!(name: "Sesame Oil", calories: 120)
    @ramen.ingredients.create!(name: "Mirin", calories: 35)
    @ramen.ingredients.create!(name: "Soy Sauce", calories: 9)
    @ramen.ingredients.create!(name: "Green Onion", calories: 5)
    @ramen.ingredients.create!(name: "Chicken Stock", calories: 86)
    @ramen.ingredients.create!(name: "Ramen Wheat Noodles", calories: 200)

    @egg = Ingredient.create!(name: "Egg", calories: 78)

    visit "/dishes/#{@ramen.id}"
  end

  #   Story 1 of 3
  # As a visitor
  # When I visit a dish's show page
  # I see the dish’s name and description
  # And I see a list of ingredients for that dish
  # and a total calorie count for that dish
  # And I see the chef's name.

  it "displays dish name and description" do
    expect(page).to have_content("Ramen")
    expect(page).to have_content("A comforting and easy to make ramen!")
  end

  it "has a list of ingredients" do
    expect(page).to have_content("Chicken Breasts")
    expect(page).to have_content("Ginger")
    expect(page).to have_content("Garlic")
    expect(page).to have_content("Sesame Oil")
    expect(page).to have_content("Mirin")
    expect(page).to have_content("Soy Sauce")
    expect(page).to have_content("Green Onion")
    expect(page).to have_content("Chicken Stock")
    expect(page).to have_content("Ramen Wheat Noodles")
  end

  it "has a total calories" do
    expect(page).to have_content("Calories: 700")
  end

  it "has chef's name" do
    expect(page).to have_content("Chef: Wakako Okada")
  end



  # Story 2 of 3

  # As a visitor
  # When I visit a dish's show page
  # I see a form to add an existing Ingredient to that Dish
  # When I fill in the form with the ID of an Ingredient that exists in the database
  # And I click Submit
  # Then I am redirected to that dish's show page
  # And I see that ingredient is now listed. 

  it "has form to add ingredient" do
    expect(page).to have_field(:dish_add_ingredient)

    fill_in(:dish_add_ingredient, with: @egg.id)
    click_button("Add Ingredient")

    expect(current_path).to eq(dish_path(@ramen))
    expect(page).to have_content("Egg")
    expect(page).to have_content("Calories: 778")
  end

end
require "rails_helper"

RSpec.describe "Chef show page" do
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
    @ramen.ingredients.create!(name: "Egg", calories: 78)

    @soft_egg = @wakako.dishes.create!(name: "Soft Egg", description: "Its an Egg!")
    @soft_egg.ingredients.create!(name: "Egg", calories: 78)
    @soft_egg.ingredients.create!(name: "Soy Sauce", calories: 9)
    @soft_egg.ingredients.create!(name: "Chicken Stock", calories: 86)

    visit "/chefs/#{@wakako.id}"
  end

  # Story 3 of 3

  # As a visitor
  # When I visit a chef's show page
  # I see a link to view a list of all ingredients that this chef uses in their dishes.
  # When I click on that link
  # I'm taken to a chef's ingredients index page
  # and I can see a unique list of names of all the ingredients that this chef uses.

  it "shows chef's name" do
    expect(page).to have_content("Wakako Okada")
    expect(page).to have_link("Ingredients I use", href: "/chefs/#{@wakako.id}/ingredients")
  end

  # Extension

  # As a visitor
  # When I visit a chef's show page
  # I see the three most popular ingredients that the chef uses in their dishes
  # (Popularity is based off of how many dishes use that ingredient)

  it "shows the chef's 3 most used ingredients" do
    expect(page).to have_content("My Favorite Ingredients:")
    expect(page).to have_content("Egg Used in 2 dishes")
    expect(page).to have_content("Soy Sauce Used in 2 dishes")
    expect(page).to have_content("Chicken Stock Used in 2 dishes")
  end

end
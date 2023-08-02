require "rails_helper" 

RSpec.describe "Chef's Ingredients Index Page" do
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
  end

  # Story 3 of 3

  # As a visitor
  # When I visit a chef's show page
  # I see a link to view a list of all ingredients that this chef uses in their dishes.
  # When I click on that link
  # I'm taken to a chef's ingredients index page
  # and I can see a unique list of names of all the ingredients that this chef uses.

  it "has list of ingredients this chef uses" do
    visit "/chefs/#{@wakako.id}"

    click_link("Ingredients I use")
    expect(current_path).to eq("/chefs/#{@wakako.id}/ingredients")

    expect(page).to have_content("Chicken Breasts", count: 1)
    expect(page).to have_content("Ginger", count: 1)
    expect(page).to have_content("Garlic", count: 1)
    expect(page).to have_content("Sesame Oil", count: 1)
    expect(page).to have_content("Mirin", count: 1)
    expect(page).to have_content("Soy Sauce", count: 1)
    expect(page).to have_content("Green Onion", count: 1)
    expect(page).to have_content("Chicken Stock", count: 1)
    expect(page).to have_content("Ramen Wheat Noodles", count: 1)
  end
end
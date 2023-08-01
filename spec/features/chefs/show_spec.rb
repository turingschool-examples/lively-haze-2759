require "rails_helper"

RSpec.describe "When I visit a Chef show page", type: :feature do
  before do
    @jeff = Chef.create!(name: "Chef Jeff")
    @greg = Chef.create!(name: "Chef Greg")
    @burger = @jeff.dishes.create!(name: "Borger", description: "it big")
    @pasta = @jeff.dishes.create!(name: "Limone", description: "creamy and lemony")
    @bun = @burger.ingredients.create!(name: "bun", calories: 150)
    @beef = @burger.ingredients.create!(name: "beef", calories: 300)
    @cheese = @burger.ingredients.create!(name: "cheese", calories: 200)
    @spaghetti = @pasta.ingredients.create!(name: "spaghetti", calories: 200)
    @butter = @pasta.ingredients.create!(name: "butter", calories: 130)
    @lemon = @pasta.ingredients.create!(name: "lemon", calories: 20)
  end

  it "I see a link to the list of ingredients this chef uses in their dishes" do
    visit "chefs/#{@jeff.id}"

    expect(page).to have_link("View Chef's Ingredients", href: "/chefs/#{@jeff.id}/ingredients")
  end

  it "takes the me to a chef's ingredients index page when clicking the link" do
    visit "/chefs/#{@jeff.id}"
    click_link("View Chef's Ingredients")
    expect(page).to have_current_path("/chefs/#{@jeff.id}/ingredients")
  end
  
  it "displays a unique list of ingredient names used by the chef" do
    visit "/chefs/#{@jeff.id}/ingredients"
    save_and_open_page
    expect(page).to have_content("Chef Jeff's Ingredients:")
    expect(page).to have_content("bun")
    expect(page).to have_content("beef")
    expect(page).to have_content("cheese")
    expect(page).to have_content("spaghetti")
    expect(page).to have_content("butter")
    expect(page).to have_content("lemon")
    expect(page).to_not have_content("Limone")
  end
end
require "rails_helper"

RSpec.describe "When I visit a dish show page", type: :feature do
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

  it "I see the dishes name and description" do
    visit "dishes/#{@burger.id}"

    expect(page).to have_content(@burger.name)
    expect(page).to have_content(@burger.description)

    expect(page).to_not have_content(@pasta.name)
    expect(page).to_not have_content(@pasta.description)
  end

  it "I see a list of ingredients for that dish" do
    visit "dishes/#{@burger.id}"

    expect(page).to have_content(@bun.name)
    expect(page).to have_content(@beef.name)
    expect(page).to have_content(@cheese.name)

    expect(page).to_not have_content(@spaghetti.name)
    expect(page).to_not have_content(@butter.name)
    expect(page).to_not have_content(@lemon.name)
  end

  it "I see a total calorie count for the dish" do
    visit "dishes/#{@burger.id}"

    expect(page).to have_content("Total Calories: #{@burger.total_calorie_count}")
  end

  it "I see the chef's name" do
    visit "dishes/#{@burger.id}"

    expect(page).to have_content(@jeff.name)
    expect(page).to_not have_content(@greg.name)
  end
end
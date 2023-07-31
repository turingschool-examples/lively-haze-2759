require "rails_helper"


RSpec.describe "Dish Show Page" do
  before :each do
    load_test_data
    visit chef_dish_path(@chef_1, @dish_1)
  end

  it "displays the dish's name and description" do
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
  end

  it "displays a list of its ingredients" do
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to have_content(@ingredient_4.name)
  end

  it "displays total calorie count" do
    expect(page).to have_content("540")
  end

  it "displays the chef's name" do
    expect(page).to have_content("Anna")
  end
end
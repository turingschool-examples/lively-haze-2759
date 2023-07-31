require "rails_helper"

RSpec.describe "Dish Show Page" do
  before(:each) do
    test_data
  end

  it "displays the dish's name and description" do
    visit dish_path(@risotto)

    expect(page).to have_content(@risotto.name)
    expect(page).to have_content(@risotto.description)
  end

  it "displays a list of ingredients and calorie count for that dish" do
    visit dish_path(@risotto)

    expect(page).to have_content("Rice")
    expect(page).to have_content("200 calories")
  end

  it "displays the chefs name" do
    visit dish_path(@risotto)

    expect(page).to have_content("Gordon Ramsey")
  end

  it "has a form with an option to add an existing ingredient to the dish" do
    visit dish_path(@bw)

    expect(page).to have_button("Add Ingredient")
    #I can't get my button to actually update my ingredients :((
  end
end
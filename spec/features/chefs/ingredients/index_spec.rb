require 'rails_helper'

RSpec.describe 'Chefs Ingredients Index', type: :feature do
  before :each do
    load_test_data
  end

  # User Story 3 (continued)

  #   As a visitor
  # When I visit a chef's show page
  # I see a link to view a list of all ingredients that this chef uses in their dishes.
  # When I click on that link
  # I'm taken to a chef's ingredients index page
  # and I can see a unique list of names of all the ingredients that this chef uses.

  it 'shows a unique list of names of all the ingredients that this chef uses' do
    visit chef_path(@chef1)
    click_link 'View Ingredients'
    expect(current_path).to eq(chef_ingredients_path(@chef1))

    @chef1.unique_ingredients.each do |ingredient|
      expect(page).to have_content(ingredient.name)
    end
  end

  it 'does not show duplicate ingredients' do
    visit chef_path(@chef1)
    click_link 'View Ingredients'
    expect(current_path).to eq(chef_ingredients_path(@chef1))

    expect(page).to have_content(@ingredient1.name, count: 1)
    expect(page).to have_content(@ingredient2.name, count: 1)
    expect(page).to have_content(@ingredient3.name, count: 1)
    expect(page).to have_content(@ingredient4.name, count: 1)
  end

  it 'does not show ingredients from other chefs' do
    visit chef_path(@chef1)
    click_link 'View Ingredients'
    expect(current_path).to eq(chef_ingredients_path(@chef1))

    expect(page).to_not have_content(@ingredient5.name)
    expect(page).to_not have_content(@ingredient6.name)
  end
end

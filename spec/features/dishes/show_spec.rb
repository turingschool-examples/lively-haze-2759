require 'rails_helper'

RSpec.describe 'Dishes Show Happy Path' do
  before :each do
    load_test_data
  end

  # User Story 1:
  #   As a visitor
  # When I visit a dish's show page
  # I see the dish’s name and description
  # And I see a list of ingredients for that dish
  # and a total calorie count for that dish
  # And I see the chef's name.

  it 'shows the name of the chef that made that dish' do
    visit dish_path(@dish1)

    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.description)
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@chef1.name)
    expect(page).to have_content(@dish1.calorie_count)
  end

  it 'does not show the name of the chef that did not make that dish' do
    visit dish_path(@dish1)
    expect(page).to_not have_content(@chef2.name)
  end

  # User Story 2
  #   As a visitor
  # When I visit a dish's show page
  # I see a form to add an existing Ingredient to that Dish
  # When I fill in the form with the ID of an Ingredient that exists in the database
  # And I click Submit
  # Then I am redirected to that dish's show page
  # And I see that ingredient is now listed.

  it 'has a form to add an existing ingredient to that dish' do
    visit dish_path(@dish1)

    expect(page).to have_content('Add Ingredient')
    expect(page).to have_field('dish_ingredient_ingredient_id')
    expect(page).to have_button('Add Ingredient')
  end

  it 'can add an existing ingredient to that dish' do
    visit dish_path(@dish1)
    fill_in 'dish_ingredient_ingredient_id', with: @ingredient3.id
    click_button 'Add Ingredient'
    expect(current_path).to eq(dish_path(@dish1))
    expect(page).to have_content(@ingredient3.name)
  end
end

describe 'Dishes Show Sad Path' do
  before :each do
    load_test_data
  end

  it 'shows an error message if the ingredient is already included in the dish' do
    visit dish_path(@dish1)
    fill_in 'dish_ingredient_ingredient_id', with: @ingredient1.id
    click_button 'Add Ingredient'
    expect(current_path).to eq(dish_path(@dish1))
    expect(page).to have_content('This ingredient is already included in the dish')
  end
end

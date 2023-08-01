require 'rails_helper'

RSpec.describe 'Chefs Show', type: :feature do
  before :each do
    load_test_data
  end

  # User Story 3

  #   As a visitor
  # When I visit a chef's show page
  # I see a link to view a list of all ingredients that this chef uses in their dishes.
  # When I click on that link
  # I'm taken to a chef's ingredients index page
  # and I can see a unique list of names of all the ingredients that this chef uses.
  it 'shows a link to view a list of all ingredients that this chef uses in their dishes' do
    visit chef_path(@chef1)

    expect(page).to have_link('View Ingredients')
  end

  # User Story 3 Testing Continues on chefs/ingredients/index_spec.rb
end

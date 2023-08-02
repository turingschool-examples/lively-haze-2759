require "rails_helper"

RSpec.describe "Chef show page" do
  before do
    @wakako = Chef.create!(name: "Wakako Okada")

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
    expect(page).to have_link("Ingredients I use", href: "/chefs/#{@chef_id}/ingredients")
  end

end
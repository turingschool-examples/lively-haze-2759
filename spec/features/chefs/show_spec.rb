require "rails_helper"

RSpec.describe "Chef Show page" do
  before do
    @fred = Chef.create!(name: "Fred Tasty")
  end

  it "shows the chef's name" do
    visit chef_path(@fred)

    expect(page).to have_content("Chef: Fred Tasty")
  end

  #User story 3, part 1
  it "has a link to the chef's ingredients index" do
    visit chef_path(@fred)

    expect(page).to have_link("Click To View Ingredients This Chef Uses", href: chef_ingredients_path(@fred))
  end
end
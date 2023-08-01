require "rails_helper"

RSpec.describe "Chef Show Page" do
  before(:each) do
    test_data
  end
  it "displays a link to chef ingredient index page" do
    visit chef_path(@chef_1)

    expect(page).to have_link "See #{@chef_1.name}'s ingredients"

    click_link "See #{@chef_1.name}'s ingredients"

    expect(path).to eq("/chefs/#{@chef_1.id}/ingredients")
  end
end
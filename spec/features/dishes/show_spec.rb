require "rails_helper"

RSpec.describe "Dish Show Page" do
  before(:each) do

  end

  it "displays the dish's name and description" do
    visit "/dishes/#{dish.id}"

    expect(page).to have_content()
  end
end
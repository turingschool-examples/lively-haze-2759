require "rails_helper"

RSpec.describe "Chef Show Page" do
  before(:each) do
    test_data
  end
  it "displays a link to chef ingredient index page" do
    visit chef_path(@chef_1)


  end
end
require 'rails_helper'

RSpec.describe Chef, type: :model do
  before(:each) do
    test_data
  end

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
  end

  describe "instance methods" do
    it "#unique_ingredients" do
      expect(@chef_1.unique_ingredients).to eq(["Beef", "Carrot", "Onion", "Salt"])
      expect(@chef_2.unique_ingredients).to eq(["Beef", "Fish", "Onion", "Salt"])
      expect(@chef_1.unique_ingredients).to_not eq(["Beef", "Beef"])
    end
  end
end
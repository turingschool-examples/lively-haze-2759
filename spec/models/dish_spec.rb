require "rails_helper"
require "spec_data"


RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
      it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance_methods" do
    before :each do
      dish_test_data
    end
    describe "#calories" do
      it "returns the total calories of a dish" do
        expect(@dish1.calories).to eq(250)
      end
    end
  end
end
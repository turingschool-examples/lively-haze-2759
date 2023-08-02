require 'rails_helper'

RSpec.describe Dish, type: :model do
  before(:each) do
    load_test_data
  end

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many(:dish_ingredients)}
      it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "#instance_methods" do
    describe "#total_calories" do
      it "shows the total calories for that dish" do
        expect(@dish_1.total_calories).to be(300)
        expect(@dish_2.total_calories).to be(1000)
        expect(@dish_3.total_calories).to be(400)
      end
    end
  end

end
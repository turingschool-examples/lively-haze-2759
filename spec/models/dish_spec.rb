require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :description }
  end

  describe "relationships" do
      it  {should belong_to :chef }
      it { should have_many :dish_ingredients }
      it { should have_many :ingredients }
  end

  describe "instance methods" do
    describe "#calorie_count" do
      it "adds up the calories from all ingredients in a dish to display a single integer" do
        load_test_data

        expect(@dish_1.calorie_count).to eq(540)
        expect(@dish_2.calorie_count).to eq(350)
        expect(@dish_3.calorie_count).to eq(490)
      end
    end
  end

end
require 'rails_helper'

RSpec.describe Dish, type: :model do
  before(:each) do
    test_data
  end
  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
  end

  describe "instance methods" do
    it "#total_calorie_count" do
      expect(@dish_1.total_calorie_count).to eq(140)
      expect(@dish_2.total_calorie_count).to eq(870)
      expect(@dish_1.total_calorie_count).to_not eq(1)
    end
  end
end
require 'rails_helper'

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
  describe "calorie count" do
    it "counts calories" do
      chef = Chef.create!(name: "Burger Man")

    dish1 = chef.dishes.create!(name: 'Spaget', description: "noodles and sauce")
    ingredient1 = dish1.ingredients.create!(name: 'tomato', calories: 25)
    ingredient2 = dish1.ingredients.create!(name: 'noodle', calories: 35)

    expect(dish1.calorie_count).to eq(60)
  
    end
  end

end
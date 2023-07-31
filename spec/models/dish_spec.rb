require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :ingredient_dishes}
      it {should have_many(:ingredients).through :ingredient_dishes}
  end

  describe "instance methods" do
    before do
    @jeff = Chef.create!(name: "Chef Jeff")
    @burger = @jeff.dishes.create!(name: "Borger", description: "it big")
    @pasta = @jeff.dishes.create!(name: "Limone", description: "creamy and lemony")
    @bun = @burger.ingredients.create!(name: "bun", calories: 150)
    @beef = @burger.ingredients.create!(name: "beef", calories: 300)
    @cheese = @burger.ingredients.create!(name: "cheese", calories: 200)
    @spaghetti = @pasta.ingredients.create!(name: "spaghetti", calories: 200)
    @butter = @pasta.ingredients.create!(name: "butter", calories: 130)
    @lemon = @pasta.ingredients.create!(name: "lemon", calories: 20)
    end

    it "#total_calorie_count" do
      expect(@burger.total_calorie_count).to eq(650)
    end
  end

end
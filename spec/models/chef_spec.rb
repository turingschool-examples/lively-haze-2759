require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
  end

  describe 'instance methods' do
    before do
      @jeff = Chef.create!(name: "Chef Jeff")
      @greg = Chef.create!(name: "Chef Greg")
      @burger = @jeff.dishes.create!(name: "Borger", description: "it big")
      @pasta = @greg.dishes.create!(name: "Limone", description: "creamy and lemony")
      @bun = @burger.ingredients.create!(name: "bun", calories: 150)
      @beef = @burger.ingredients.create!(name: "beef", calories: 300)
      @cheese = @burger.ingredients.create!(name: "cheese", calories: 200)
      @spaghetti = @pasta.ingredients.create!(name: "spaghetti", calories: 200)
      @butter = @pasta.ingredients.create!(name: "butter", calories: 130)
      @lemon = @pasta.ingredients.create!(name: "lemon", calories: 20)
    end
      it '#unique_ingredients' do
        ingredients = @jeff.unique_ingredients

        expect(ingredients).to contain_exactly(@beef.name, @bun.name, @cheese.name)
      end
  end
end
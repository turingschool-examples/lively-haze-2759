require 'rails_helper'

RSpec.describe DishIngredient, type: :model do
  describe 'Associations' do
    it { should belong_to :dish }
    it { should belong_to :ingredient }
  end

  describe 'Instance Methods' do
    
  end
end
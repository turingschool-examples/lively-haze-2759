class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :calories, numericality: { only_integer: true }

  has_many :dishes_ingredients
  has_many :dishes, through: :dishes_ingredients
end

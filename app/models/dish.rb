class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  # US1 edits
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients
end
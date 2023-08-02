class AddDishCountToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :dish_count, :integer
    add_column :ingredients, :default, :string
    add_column :ingredients, :0, :string
  end
end

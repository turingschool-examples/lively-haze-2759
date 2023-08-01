class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :calories
      t.timestamps
    end

    create_table :dish_ingredients do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
    end

    add_index :dish_ingredients, [:dish_id, :ingredient_id], unique: true
  end
end

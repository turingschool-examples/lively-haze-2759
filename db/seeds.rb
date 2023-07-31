# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
DishIngredient.destroy_all
Ingredient.destroy_all
Dish.destroy_all
Chef.destroy_all

@chef_1 = Chef.create!(name: "Gordon Ramsay")

@dish_1 = @chef_1.dishes.create!(name: "Beef Wellington", description: "Some fancy beef meal")
@dish_2 = @chef_1.dishes.create!(name: "Chicken Piccata", description: "Some delicious chicken meal")

@beef = Ingredient.create!(name: "Beef Tenerloin", calories: 213)
@salt = Ingredient.create!(name: "Salt", calories: 60)
@pepper = Ingredient.create!(name: "Pepper", calories: 75)
@pastry = Ingredient.create!(name: "Puff Pastry", calories: 438)

@chicken = Ingredient.create!(name: "Chicken", calories: 120)
@garlic = Ingredient.create!(name: "Garlic", calories: 80)
@lemon = Ingredient.create!(name: "Lemon", calories: 76)
@cream = Ingredient.create!(name: "Heavy Cream", calories: 120)
@capers = Ingredient.create!(name: "Capers", calories: 60)

DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @beef.id)
DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @salt.id)
DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @pepper.id)
DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @pastry.id)

DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @chicken.id)
DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @garlic.id)
DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @lemon.id)
DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @cream.id)
DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @capers.id)
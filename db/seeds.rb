# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@jeff = Chef.create!(name: "Chef Jeff")
@greg = Chef.create!(name: "Chef Greg")
@burger = @jeff.dishes.create!(name: "Borger", description: "it big")
@pasta = @jeff.dishes.create!(name: "Limone", description: "creamy and lemony")
@bun = @burger.ingredients.create!(name: "bun", calories: 150)
@beef = @burger.ingredients.create!(name: "beef", calories: 300)
@cheese = @burger.ingredients.create!(name: "cheese", calories: 200)
@spaghetti = @pasta.ingredients.create!(name: "spaghetti", calories: 200)
@butter = @pasta.ingredients.create!(name: "butter", calories: 130)
@lemon = @pasta.ingredients.create!(name: "lemon", calories: 20)


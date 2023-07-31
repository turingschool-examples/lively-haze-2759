chef_1 = Chef.create!(name: "Gordon Ramsey")
chef_2 = Chef.create!(name: "Paul Hollywood")

risotto = chef_1.dishes.create!(name: "Mushroom Risotto", description: "Creamy Arborio Rice with Mushrooms")
bw = chef_1.dishes.create!(name: "Beef Wellington", description: "Steak and Carbs; What More Could You Want?")
tart = chef_2.dishes.create!(name: "Lemon Tart", description: "Lemony Goodness")
rat = chef_2.dishes.create!(name: "Ratatouille", description: "I Just Now Understand Why That Movie Is Named Ratatouille")

ingredient_1 = Ingredient.create!(name: "Rice", calories: 200)
ingredient_2 = Ingredient.create!(name: "Steak", calories: 300)
ingredient_3 = Ingredient.create!(name: "Pastry", calories: 450)
ingredient_4 = Ingredient.create!(name: "Zucchini", calories: 50)

DishIngredient.create!(dish_id: risotto.id, ingredient_id: ingredient_1.id)
DishIngredient.create!(dish_id: bw.id, ingredient_id: ingredient_2.id)
DishIngredient.create!(dish_id: tart.id, ingredient_id: ingredient_3.id)
DishIngredient.create!(dish_id: rat.id, ingredient_id: ingredient_4.id)


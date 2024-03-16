import 'package:flutter/material.dart';
class Recipe {
  final String name;
  final List<String> ingredients;
  final String instructions;
  final String diet; // Add diet property
  final String imagePath;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.diet,
    required this.imagePath// Initialize diet property
  });
}


class MyRecipesProvider extends ChangeNotifier {
  final List<Recipe> _myRecipes = [];

  List<Recipe> get myRecipes => _myRecipes;

  List<Recipe> get recipes => _myRecipes;

  List<Recipe> get favoriteRecipes => _myRecipes;
  void addRecipe({required Recipe recipe}) {
    favoriteRecipes.add(recipe);
    notifyListeners();
  }
}

class RecipeProvider extends ChangeNotifier {
  List<Recipe> recipes = [
    Recipe(
      name: 'Chicken Curry',
      ingredients: ['Chicken', 'Curry Powder', 'Vegetables', 'Spices'],
      instructions: '1. Heat oil in a pan and sauté onions until golden brown.\n2. Add chicken pieces and cook until they are slightly browned.\n3. Stir in curry powder and mix well.\n4. Add vegetables of your choice and cook until they are tender.\n5. Season with spices and simmer until the curry thickens.\n6. Serve hot with rice or naan.',
      diet: 'Meat',
      imagePath: 'assets/images/Air-Fryer-Chicken-Curry-Tall-FS-36.webp'
    ),
    Recipe(
      name: 'Pasta Carbonara',
      ingredients: ['Pasta', 'Bacon', 'Eggs', 'Parmesan Cheese'],
      instructions: '1. Cook pasta according to package instructions.\n2. In a separate pan, cook bacon until crispy.\n3. In a bowl, whisk together eggs and grated Parmesan cheese.\n4. Drain the pasta and immediately toss it with the egg mixture.\n5. Add cooked bacon and stir until the sauce thickens.\n6. Serve hot with extra Parmesan cheese and black pepper.',
      diet: 'Vegetarian',
      imagePath: 'assets/images/spaghetti-carbonara-01.jpg'
    ),
    Recipe(
      name: 'Vegetable Stir-Fry',
      ingredients: ['Mixed Vegetables', 'Soy Sauce', 'Ginger', 'Garlic'],
      instructions: '1. Heat oil in a wok or skillet over high heat.\n2. Add minced garlic and ginger, and stir-fry for a few seconds.\n3. Add mixed vegetables and stir-fry until they are tender-crisp.\n4. Drizzle soy sauce over the vegetables and toss to combine.\n5. Cook for another minute, then remove from heat.\n6. Serve hot as a side dish or over rice.',
      diet: 'Vegan',
      imagePath: 'assets/images/vegetable_stir_fry.jpg'
    ),
    Recipe(
      name: 'Tacos',
      ingredients: ['Ground Beef', 'Taco Seasoning', 'Tortillas', 'Cheese'],
      instructions: '1. In a skillet, cook ground beef until browned.\n2. Stir in taco seasoning and cook according to package instructions.\n3. Warm tortillas in a separate pan or microwave.\n4. Assemble tacos by filling each tortilla with seasoned beef and shredded cheese.\n5. Serve hot with your favorite toppings such as lettuce, tomato, and salsa.',
      diet: 'Meat',
      imagePath: 'assets/images/Ground-Beef-Tacos-9.jpg'
    ),
    Recipe(
      name: 'Chocolate Cake',
      ingredients: ['Flour', 'Sugar', 'Cocoa Powder', 'Eggs', 'Milk'],
      instructions: '1. Preheat oven to 350°F (175°C) and grease a cake pan.\n2. In a bowl, whisk together flour, sugar, and cocoa powder.\n3. Add eggs and milk, and mix until smooth.\n4. Pour the batter into the prepared pan and bake for 30-35 minutes.\n5. Let the cake cool completely before serving.\n6. Optional: frost with chocolate frosting and decorate with sprinkles.',
      diet: 'Vegan',
      imagePath: 'assets/images/choco.jpg'
    ),
    Recipe(
      name: 'Grilled Salmon',
      ingredients: ['Salmon Fillet', 'Olive Oil', 'Lemon', 'Salt', 'Pepper'],
      instructions: '1. Preheat grill to medium-high heat.\n2. Brush salmon fillets with olive oil and season with salt and pepper.\n3. Place salmon on the grill, skin-side down, and cook for 4-5 minutes per side.\n4. Squeeze lemon juice over the salmon during the last minute of grilling.\n5. Remove salmon from the grill and serve hot with lemon wedges.',
      diet: 'Keto',
      imagePath: 'assets/images/featured-grilled-salmon-recipe.jpg'
    ),
    Recipe(
      name: 'Avocado Salad',
      ingredients: ['Avocado', 'Lettuce', 'Cherry Tomatoes', 'Cucumber', 'Olive Oil'],
      instructions: '1. Chop lettuce, cucumber, and cherry tomatoes and place them in a bowl.\n2. Peel and dice avocado, then add it to the bowl.\n3. Drizzle olive oil over the salad and toss gently to coat.\n4. Season with salt and pepper to taste.\n5. Serve immediately as a refreshing side dish or light meal.',
      diet: 'Keto',
      imagePath: 'assets/images/avocado-salad-7.jpg'
    ),
    Recipe(
      name: 'Steak with Roasted Vegetables',
      ingredients: ['Beef Steak', 'Broccoli', 'Carrots', 'Zucchini', 'Olive Oil', 'Garlic'],
      instructions: '1. Preheat oven to 400°F (200°C) and line a baking sheet with parchment paper.\n2. Place steak on the baking sheet and drizzle with olive oil.\n3. Season with minced garlic, salt, and pepper.\n4. Arrange chopped vegetables around the steak and drizzle with olive oil.\n5. Roast in the oven for 20-25 minutes or until the steak reaches desired doneness and the vegetables are tender.\n6. Remove from the oven and let it rest for a few minutes before serving.',
      diet: 'Paleo',
      imagePath: 'assets/images/Steak-with-Roasted-Veggies-1-3.webp'
    ),
    Recipe(
      name: 'Baked Chicken with Sweet Potatoes',
      ingredients: ['Chicken Breast', 'Sweet Potatoes', 'Rosemary', 'Salt', 'Pepper'],
      instructions: '1. Preheat oven to 375°F (190°C) and grease a baking dish.\n2. Season chicken breasts with salt, pepper, and chopped rosemary.\n3. Peel and slice sweet potatoes, then arrange them in the baking dish.\n4. Place seasoned chicken breasts on top of the sweet potatoes.\n5. Drizzle olive oil over the chicken and sweet potatoes.\n6. Bake in the preheated oven for 25-30 minutes or until the chicken is cooked through and the sweet potatoes are tender.\n7. Serve hot and enjoy!',
      diet: 'Paleo',
      imagePath: 'assets/images/charred-chicken-with-sweet-potatoes-and-oranges-BA-011917.webp'
    ),
    Recipe(
      name: 'Macaroni and Cheese',
      ingredients: ['Elbow Macaroni', 'Cheddar Cheese', 'Milk', 'Butter', 'Flour', 'Salt', 'Pepper', 'Bread Crumbs'],
      instructions: '1. Cook elbow macaroni according to package instructions, then drain and set aside.\n2. In a saucepan, melt butter over medium heat.\n3. Whisk in flour to create a roux, then gradually add milk while whisking constantly.\n4. Cook until sauce thickens, then add shredded cheddar cheese, salt, and pepper.\n5. Stir until cheese is melted and sauce is smooth.\n6. Add cooked macaroni to the cheese sauce and stir until well combined.\n7. Transfer macaroni and cheese mixture to a baking dish.\n8. Sprinkle bread crumbs over the top.\n9. Bake in a preheated oven at 350°F (175°C) for 20-25 minutes, or until golden and bubbly.\n10. Let cool slightly before serving.\n11. Enjoy this creamy and comforting American classic!',
      diet: 'Vegetarian',
      imagePath: 'assets/images/macaroni_and_cheese.webp',
    ),
   Recipe(
      name: 'Caprese Salad',
      ingredients: ['Tomato', 'Fresh Mozzarella', 'Basil Leaves', 'Balsamic Vinegar', 'Olive Oil', 'Salt', 'Pepper'],
      instructions: '1. Slice tomatoes and fresh mozzarella into even slices.\n2. Arrange slices on a plate, alternating between tomato and mozzarella.\n3. Place basil leaves on top.\n4. Drizzle with balsamic vinegar and olive oil.\n5. Season with salt and pepper.\n6. Serve as a refreshing appetizer or side dish.',
      diet: 'Vegetarian',
      imagePath: 'assets/images/caprese_salad.jpg',
    ),
    Recipe(
      name: 'Teriyaki Tofu Stir-Fry',
      ingredients: ['Tofu', 'Broccoli', 'Bell Pepper', 'Carrot', 'Soy Sauce', 'Teriyaki Sauce', 'Sesame Oil', 'Rice'],
      instructions: '1. Press tofu to remove excess water, then cut into cubes.\n2. Heat sesame oil in a pan and add tofu cubes. Cook until golden brown.\n3. Add chopped broccoli, bell pepper, and carrot to the pan.\n4. Stir in soy sauce and teriyaki sauce.\n5. Cook until vegetables are tender.\n6. Serve over cooked rice.',
      diet: 'Vegan',
      imagePath: 'assets/images/teriyaki_tofu_stir_fry.jpg',
    ),
    Recipe(
      name: 'Spaghetti Bolognese',
      ingredients: ['Spaghetti', 'Ground Beef', 'Tomato Sauce', 'Onion', 'Garlic', 'Carrot', 'Celery', 'Red Wine', 'Parmesan Cheese'],
      instructions: '1. Cook spaghetti according to package instructions.\n2. In a separate pan, sauté chopped onion, garlic, carrot, and celery until softened.\n3. Add ground beef and cook until browned.\n4. Stir in tomato sauce and red wine.\n5. Simmer until the sauce thickens.\n6. Serve sauce over cooked spaghetti with grated Parmesan cheese.',
      diet: 'Meat',
      imagePath: 'assets/images/spaghetti_bolognese.jpg',
    ),
    Recipe(
      name: 'Quinoa Salad with Avocado and Chickpeas',
      ingredients: ['Quinoa', 'Avocado', 'Chickpeas', 'Cucumber', 'Tomato', 'Red Onion', 'Lemon Juice', 'Olive Oil', 'Cilantro'],
      instructions: '1. Cook quinoa according to package instructions and let cool.\n2. Dice avocado, cucumber, tomato, and red onion.\n3. In a large bowl, combine cooked quinoa, diced vegetables, and drained chickpeas.\n4. Dress salad with lemon juice, olive oil, and chopped cilantro.\n5. Toss to combine and serve chilled or at room temperature.',
      diet: 'Gluten-Free, Vegan',
      imagePath: 'assets/images/quinoa_salad.webp',
    ),
    Recipe(
      name: 'Honey Garlic Shrimp',
      ingredients: ['Shrimp', 'Honey', 'Soy Sauce', 'Garlic', 'Ginger', 'Green Onion', 'Sesame Seeds', 'Rice'],
      instructions: '1. In a bowl, whisk together honey, soy sauce, minced garlic, and grated ginger.\n2. Add cleaned shrimp to the bowl and marinate for 15-30 minutes.\n3. Heat oil in a pan and add marinated shrimp. Cook until pink and opaque.\n4. Garnish with sliced green onions and sesame seeds.\n5. Serve over cooked rice.',
      diet: 'Pescatarian',
      imagePath: 'assets/images/honey_garlic_shrimp.webp',
    ),
    Recipe(
      name: 'Vegetable Lasagna',
      ingredients: ['Lasagna Noodles', 'Zucchini', 'Yellow Squash', 'Bell Pepper', 'Spinach', 'Ricotta Cheese', 'Mozzarella Cheese', 'Marinara Sauce'],
      instructions: '1. Preheat oven to 375°F (190°C).\n2. Slice zucchini, yellow squash, and bell pepper into thin slices.\n3. In a baking dish, layer marinara sauce, lasagna noodles, sliced vegetables, ricotta cheese, and mozzarella cheese.\n4. Repeat layers until the dish is filled.\n5. Cover with foil and bake for 45 minutes.\n6. Remove foil and bake for an additional 15 minutes until cheese is bubbly and golden.\n7. Let cool slightly before serving.',
      diet: 'Vegetarian',
      imagePath: 'assets/images/vegetable_lasagna.png',
    ),
    Recipe(
      name: 'Greek Salad',
      ingredients: ['Cucumber', 'Tomato', 'Red Onion', 'Feta Cheese', 'Kalamata Olives', 'Olive Oil', 'Red Wine Vinegar', 'Dried Oregano', 'Salt', 'Pepper'],
      instructions: '1. Chop cucumber, tomato, and red onion into bite-sized pieces.\n2. Place chopped vegetables in a bowl.\n3. Add crumbled feta cheese and pitted Kalamata olives.\n4. In a small bowl, whisk together olive oil, red wine vinegar, dried oregano, salt, and pepper to make the dressing.\n5. Pour dressing over the salad and toss to combine.\n6. Serve chilled as a refreshing side dish or light lunch.',
      diet: 'Vegetarian',
      imagePath: 'assets/images/greek_salad.png',
    ),
    Recipe(
      name: 'Mushroom Risotto',
      ingredients: ['Arborio Rice', 'Mushrooms', 'Chicken or Vegetable Broth', 'Onion', 'Garlic', 'White Wine', 'Parmesan Cheese', 'Butter', 'Olive Oil', 'Salt', 'Pepper'],
      instructions: '1. Heat chicken or vegetable broth in a saucepan and keep warm.\n2. In a separate pan, heat olive oil and butter over medium heat.\n3. Add chopped onion and garlic, sauté until softened.\n4. Add sliced mushrooms and cook until tender.\n5. Stir in Arborio rice and cook for a few minutes until translucent.\n6. Deglaze the pan with white wine and cook until absorbed.\n7. Begin adding warm broth to the rice mixture, one ladleful at a time, stirring constantly until absorbed.\n8. Continue adding broth and stirring until rice is creamy and tender.\n9. Stir in grated Parmesan cheese, salt, and pepper to taste.\n10. Serve hot with additional Parmesan cheese on top.',
      diet: 'Vegetarian',
      imagePath: 'assets/images/mushroom_risotto.webp',
    ),
    Recipe(
      name: 'BBQ Pulled Pork Sandwiches',
      ingredients: ['Pork Shoulder', 'BBQ Sauce', 'Hamburger Buns', 'Cole Slaw', 'Pickles'],
      instructions: '1. Rub pork shoulder with your favorite BBQ rub.\n2. Place pork shoulder in a slow cooker and pour BBQ sauce over it.\n3. Cook on low for 8 hours or until pork is tender and easily shreds with a fork.\n4. Remove pork from slow cooker and shred with two forks.\n5. Toast hamburger buns.\n6. Serve pulled pork on toasted buns, topped with cole slaw and pickles.\n7. Enjoy your delicious BBQ pulled pork sandwiches!',
      diet: 'Meat',
      imagePath: 'assets/images/bbq_pulled_pork.jpg',
    ),
     Recipe(
      name: 'Classic Cheeseburger',
      ingredients: ['Ground Beef', 'Hamburger Buns', 'Cheddar Cheese', 'Lettuce', 'Tomato', 'Onion', 'Pickles', 'Ketchup', 'Mustard', 'Mayonnaise'],
      instructions: '1. Divide ground beef into equal portions and shape into patties.\n2. Preheat grill or skillet over medium-high heat.\n3. Cook patties for 4-5 minutes per side, or until desired doneness is reached.\n4. Toast hamburger buns on the grill or in the skillet.\n5. Place cooked patties on the bottom half of each bun.\n6. Top patties with cheese slices to melt.\n7. Add lettuce, tomato, onion, and pickles on top of the cheese.\n8. Spread ketchup, mustard, and mayonnaise on the top half of the bun.\n9. Place the top half of the bun on top of the toppings.\n10. Serve immediately with your favorite sides.\n11. Enjoy the classic American cheeseburger!',
      diet: 'Meat',
      imagePath: 'assets/images/cheeseburger.png',
    ),
  ];
  get recipesHere => recipes;

}

class GroceryListManager {
  static List<String> _groceryList = [];
  get grocerylist => _groceryList;

  static void addIngredients({required List<String> ingredients}) {
    _groceryList.addAll(ingredients);
  }

  static List<String> get groceryList => _groceryList;

  static void clearGroceryList() {
    _groceryList.clear();
  }
}

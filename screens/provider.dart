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
      instructions: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      diet: 'Meat',
      imagePath: 'assets/images/Air-Fryer-Chicken-Curry-Tall-FS-36.webp'
    ),
    Recipe(
      name: 'Pasta Carbonara',
      ingredients: ['Pasta', 'Bacon', 'Eggs', 'Parmesan Cheese'],
      instructions: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      diet: 'Vegetarian',
      imagePath: 'assets/images/spaghetti-carbonara-01.jpg'
    ),
    Recipe(
      name: 'Vegetable Stir-Fry',
      ingredients: ['Mixed Vegetables', 'Soy Sauce', 'Ginger', 'Garlic'],
      instructions: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      diet: 'Vegan',
      imagePath: 'assets/images/vegetable_stir_fry.jpg'
    ),
    Recipe(
      name: 'Tacos',
      ingredients: ['Ground Beef', 'Taco Seasoning', 'Tortillas', 'Cheese'],
      instructions: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      diet: 'Meat',
      imagePath: 'assets/images/Ground-Beef-Tacos-9.jpg'
    ),
    Recipe(
      name: 'Chocolate Cake',
      ingredients: ['Flour', 'Sugar', 'Cocoa Powder', 'Eggs', 'Milk'],
      instructions: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      diet: 'Vegan',
      imagePath: 'assets/images/choco.jpg'
    ),
    Recipe(
      name: 'Grilled Salmon',
      ingredients: ['Salmon Fillet', 'Olive Oil', 'Lemon', 'Salt', 'Pepper'],
      instructions: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      diet: 'Keto',
      imagePath: 'assets/images/featured-grilled-salmon-recipe.jpg'
    ),
    Recipe(
      name: 'Avocado Salad',
      ingredients: ['Avocado', 'Lettuce', 'Cherry Tomatoes', 'Cucumber', 'Olive Oil'],
      instructions: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      diet: 'Keto',
      imagePath: 'assets/images/avocado-salad-7.jpg'
    ),
    Recipe(
      name: 'Steak with Roasted Vegetables',
      ingredients: ['Beef Steak', 'Broccoli', 'Carrots', 'Zucchini', 'Olive Oil', 'Garlic'],
      instructions: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      diet: 'Paleo',
      imagePath: 'assets/images/Steak-with-Roasted-Veggies-1-3.webp'
    ),
    Recipe(
      name: 'Baked Chicken with Sweet Potatoes',
      ingredients: ['Chicken Breast', 'Sweet Potatoes', 'Rosemary', 'Salt', 'Pepper'],
      instructions: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      diet: 'Paleo',
      imagePath: 'assets/images/charred-chicken-with-sweet-potatoes-and-oranges-BA-011917.webp'
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

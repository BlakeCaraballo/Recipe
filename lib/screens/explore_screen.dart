import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/screens/provider.dart';
import 'package:recipe/screens/recipe_details_screen.dart'; // Import the RecipeDetailScreen

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String _selectedDiet = 'All';
  String _selectedIngredients = "All";// Default filter value
  late List<Recipe> _recipes;
  late List<Recipe> _filteredRecipes;

  @override
  void initState() {
    super.initState();
    _recipes = Provider.of<RecipeProvider>(context, listen: false).recipes;
    _filteredRecipes = _recipes;
  }

  void _filterRecipes(String diet) {
    setState(() {
      if (diet == 'All') {
        _filteredRecipes = _recipes;
      } else {
        _filteredRecipes = _recipes.where((recipe) => recipe.diet == diet).toList();
      }
    });
  }
  void _filterRecipesByIngredients(String ingredients) {
    setState(() {
      if (ingredients == 'All') {
        _filteredRecipes = _recipes;
      } else {
        _filteredRecipes = _recipes.where((recipe) => recipe.ingredients.contains(ingredients)).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6EE9C),
      appBar: AppBar(
        backgroundColor: Color(0xFF9E9D24),
        title: const Text('Explore'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<String>(
                value: _selectedDiet,
                items: <String>['All', 'Vegetarian', 'Meat',  'Vegan', 'Keto', 'Paleo'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedDiet = newValue!;
                    _filterRecipes(newValue);
                  });
                },
              ),
              DropdownButton<String>(
                value: _selectedIngredients,
                items: <String>['All', 'Pasta', 'Parmesan Cheese',  'Eggs', 'Bacon', 'Soy Sauce', 'Ginger', 'Garlic', 'Taco Seasoning', 'Cucumber', 'Chicken Breast', 'Spices'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedIngredients = newValue!;
                    _filterRecipesByIngredients(newValue);
                  });
                },
              ),

            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredRecipes.length,
              itemBuilder: (context, index) {
                Recipe recipe = _filteredRecipes[index];
                return ListTile(
                  leading: Image.asset(
                    recipe.imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  title: Text(recipe.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(selectedRecipe: recipe),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/screens/grocery_list_screen.dart';
import 'package:recipe/screens/meal_planner_screen.dart';
import 'package:recipe/screens/provider.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe selectedRecipe;

  RecipeDetailScreen({required this.selectedRecipe});

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  bool isFavorite = false;

  void addToMyRecipes(BuildContext context) {
    final myRecipesProvider = Provider.of<MyRecipesProvider>(context, listen: false);
    myRecipesProvider.addRecipe(recipe: widget.selectedRecipe);

    // Add the ingredients to the grocery list
    GroceryListManager.addIngredients(ingredients: widget.selectedRecipe.ingredients);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Recipe added to My Recipes and ingredients added to Grocery List'),
      ),
    );
  }



  void addToMealPlanner(BuildContext context) {
    // Navigate to the MealPlannerScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MealPlannerScreen()),
    );
  }

  void func(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedRecipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Set the color of the border
                width: 2.0, // Set the width of the border
              ),
              borderRadius: BorderRadius.circular(8.0), // Set the border radius to make the corners rounded
            ),child: Image.asset(widget.selectedRecipe.imagePath, width: 100, height: 100, fit: BoxFit.contain,)),
            Text(
              widget.selectedRecipe.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ingredients:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.selectedRecipe.ingredients.map((ingredient) => Text('- $ingredient')).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Instructions:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(widget.selectedRecipe.instructions),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    addToMyRecipes(context);
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 32,
                    color: isFavorite ? Colors.red : null,
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    addToMealPlanner(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  child: const Text('Add to Meal Planner'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

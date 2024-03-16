import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/screens/provider.dart';

import 'grocery_list_screen.dart';

class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({super.key});

  @override
  _MealPlannerScreenState createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  final List<List<String>> _meals = List.generate(30, (_) => []);
  late var recipeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6EE9C),
      appBar: AppBar(
        backgroundColor: Color(0xFF9E9D24),
        title: const Text('Meal Planner'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: 30,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showAddMealDialog(context, index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Text('Day ${index + 1}'),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _generateGroceryList();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF9E9D24)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: const Text('Generate Grocery List'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Planned Meals:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _meals.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Day ${index + 1}: ${_meals[index].isEmpty ? "No meal planned" : _meals[index][0]}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddMealDialog(BuildContext context, int dayIndex) {
    String mealName = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Meal for Day ${dayIndex + 1}'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter meal name',
            ),
            onChanged: (value) {
              mealName = value.toLowerCase(); // Convert meal name to lowercase
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Convert the stored meal names to lowercase for comparison
                List<String> lowercaseMeals = _meals[dayIndex].map((meal) => meal.toLowerCase()).toList();

                if (!lowercaseMeals.contains(mealName)) {
                  // Add meal to the list if it's not already present
                  setState(() {
                    _meals[dayIndex].add(mealName);
                  });
                }

                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
  
void _generateGroceryList() {
  List<String> allIngredients = [];

  // Iterate through all the meals planned in the calendar
  for (List<String> dayMeals in _meals) {
    // Iterate through each meal in the current day
    for (String mealName in dayMeals) {
      // Check if the meal name matches any recipe name
      Recipe? matchedRecipe = findRecipeByName(mealName);
      if (matchedRecipe != null) {
        // Add ingredients from the matched recipe to the grocery list
        allIngredients.addAll(matchedRecipe.ingredients);
      }
    }
  }

  // Add all ingredients to the grocery list
  GroceryListManager.addIngredients(ingredients: allIngredients);

  // Navigate to the grocery list screen
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => GroceryListScreen(),
    ),
  );
}

// Helper function to find a recipe by its name
Recipe? findRecipeByName(String name) {
  // Iterate through all recipes and check if any recipe matches the given name
  for (Recipe recipe in RecipeProvider().recipes) {
    if (recipe.name.toLowerCase() == name.toLowerCase()) {
      return recipe; // Return the matched recipe
    }
  }
  return null; // Return null if no matching recipe is found
}
}

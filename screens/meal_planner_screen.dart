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
      appBar: AppBar(
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
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
              recipeName=value;
              setState(() {
                _meals[dayIndex] = [value];
              });
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
    List<Recipe> recipes = Provider.of<RecipeProvider>(context, listen: false).recipes;
    if (recipes.contains(recipeName)) {
      List<String> ingredientsToAdd = recipes[recipeName]?.ingredients ?? [];
      GroceryListManager.addIngredients(ingredients: ingredientsToAdd);
    }

    // Navigate to the Grocery List screen and pass planned meals as ingredients
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GroceryListScreen(),
      ),
    );
  }

}

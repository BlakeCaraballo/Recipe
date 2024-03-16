import 'package:flutter/material.dart';
import 'package:recipe/screens/provider.dart';


class GroceryListScreen extends StatefulWidget {
  final List<String> ingredients = GroceryListManager.groceryList;
  GroceryListScreen({
    Key? key,
  }) : super(key: key);

  @override
  _GroceryListScreenState createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  final List<String> _purchasedItems = [];

  void _clearAllItems() {
    setState(() {
      _purchasedItems.clear();
    });
    GroceryListManager.clearGroceryList();
  }

  void _togglePurchasedStatus(String ingredient) {
    setState(() {
      if (_purchasedItems.contains(ingredient)) {
        _purchasedItems.remove(ingredient);
      } else {
        _purchasedItems.add(ingredient);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6EE9C),
      appBar: AppBar(
        backgroundColor: Color(0xFF9E9D24),
        title: const Text('Grocery List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: _clearAllItems,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: widget.ingredients.length,
          itemBuilder: (context, index) {
            final ingredient = widget.ingredients[index];
            final bool isPurchased = _purchasedItems.contains(ingredient);
            return ListTile(
              title: Text(ingredient),
              trailing: IconButton(
                icon: Icon(isPurchased ? Icons.check_box : Icons.check_box_outline_blank),
                onPressed: () {
                  _togglePurchasedStatus(ingredient);
                  if (!isPurchased) {
                    // Add ingredient to GroceryListManager when checked
                    GroceryListManager.addIngredients(ingredients: widget.ingredients);
                  }
                },
              ),
              onTap: () {
                _togglePurchasedStatus(ingredient);
                if (!isPurchased) {
                  // Add ingredient to GroceryListManager when tapped
                  GroceryListManager.addIngredients(ingredients: widget.ingredients);
                }
              },
            );
          },
        ),
      ),
    );
  }
}


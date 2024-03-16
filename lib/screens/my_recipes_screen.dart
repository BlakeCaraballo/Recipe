import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/screens/provider.dart';
import 'package:recipe/screens/recipe_details_screen.dart';

class MyRecipesScreen extends StatefulWidget {
  const MyRecipesScreen({Key? key}) : super(key: key);

  @override
  _MyRecipesScreenState createState() => _MyRecipesScreenState();
}

class _MyRecipesScreenState extends State<MyRecipesScreen> {
  late List<Recipe> _favoriteRecipes;
  late List<Recipe> _filteredRecipes;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _favoriteRecipes = Provider.of<MyRecipesProvider>(context, listen: false).favoriteRecipes;
    _filteredRecipes = _favoriteRecipes;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterRecipes(String query) {
    setState(() {
      _filteredRecipes = _favoriteRecipes
          .where((recipe) => recipe.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _navigateToRecipeDetail(Recipe recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailScreen(selectedRecipe: recipe),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6EE9C),
      appBar: AppBar(
        backgroundColor: Color(0xFF9E9D24),
        title: const Text('My Recipes'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterRecipes,
              decoration: const InputDecoration(
                labelText: 'Search Recipes',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredRecipes.length,
              itemBuilder: (context, index) {
                Recipe recipe = _filteredRecipes[index];
                return ListTile(
                  title: Text(recipe.name),
                  onTap: () {
                    _navigateToRecipeDetail(recipe);
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

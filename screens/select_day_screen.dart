import 'package:flutter/material.dart';

class SelectDayScreen extends StatelessWidget {
  const SelectDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Day'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select the day to add the meal'),
            // Add a calendar or date picker widget here
            // When the user selects a day, pass it back to the RecipeDetailScreen
          ],
        ),
      ),
    );
  }
}

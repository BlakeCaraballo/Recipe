import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/screens/provider.dart';
import 'screens/home_screen.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyRecipesProvider()),
        ChangeNotifierProvider(create: (context) => RecipeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RecipeApp(),
    );
  }
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F4C3),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Let's Explore Recipes",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
            SizedBox(height: 20),
            Text(
              "Embark on an exciting culinary adventure as you explore the vast array of recipes awaiting your discovery. Delve into a world of flavors, from comforting classics to innovative creations, curated to tantalize your taste buds and ignite your passion for cooking. With our diverse selection of recipes, you'll uncover a treasure trove of culinary inspiration, ready to elevate your dining experiences and transform your kitchen into a hub of creativity and exploration.",
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 120,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Color(0xFF9E9D24),
          child: const Text("Explore", style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}

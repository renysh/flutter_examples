import 'package:flutter/material.dart';
import 'package:flutter_examples/src/food_recipes/pages/menu_page.dart';

class FoodRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
              bodyColor: Colors.white,
            ),
      ),
      home: MenuPage(),
    );
  }
}

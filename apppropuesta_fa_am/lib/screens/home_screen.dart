import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../data/local_data.dart';
import '../widgets/recipe_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Recipe> featuredRecipes = LocalData.getRecipes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RecipeNow'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: featuredRecipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(recipe: featuredRecipes[index]);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/favorites');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}

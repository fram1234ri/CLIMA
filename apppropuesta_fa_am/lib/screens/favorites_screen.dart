import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../data/local_data.dart';
import '../services/favorites_service.dart';
import '../widgets/recipe_card.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Recipe> _favoriteRecipes = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final favoriteIds = await FavoritesService.getFavorites();
    final allRecipes = LocalData.getRecipes();

    setState(() {
      _favoriteRecipes = allRecipes
          .where((recipe) => favoriteIds.contains(recipe.id))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mis Favoritos')),
      body: _favoriteRecipes.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No tienes recetas favoritas',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _favoriteRecipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(recipe: _favoriteRecipes[index]);
              },
            ),
    );
  }
}

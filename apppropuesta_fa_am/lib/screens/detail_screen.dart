import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/favorites_service.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Recipe recipe;
  late Future<bool> isFavoriteFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    isFavoriteFuture = FavoritesService.isFavorite(recipe.id);
  }

  void _toggleFavorite(bool isCurrentlyFavorite) async {
    if (isCurrentlyFavorite) {
      await FavoritesService.removeFavorite(recipe.id);
    } else {
      await FavoritesService.addFavorite(recipe.id);
    }

    setState(() {
      isFavoriteFuture = FavoritesService.isFavorite(recipe.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        actions: [
          FutureBuilder<bool>(
            future: isFavoriteFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final isFavorite = snapshot.data!;
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: () => _toggleFavorite(isFavorite),
                );
              } else {
                return IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.fastfood,
                    size: 50,
                    color: Colors.grey[500],
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredientes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.ingredients
                        .map((ingredient) => Text('• $ingredient'))
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Preparación',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.steps
                        .asMap()
                        .entries
                        .map(
                          (entry) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text('${entry.key + 1}. ${entry.value}'),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const String _favoritesKey = 'favorites';

  static Future<void> addFavorite(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    favorites.add(recipeId);
    await prefs.setStringList(_favoritesKey, favorites.toList());
  }

  static Future<void> removeFavorite(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    favorites.remove(recipeId);
    await prefs.setStringList(_favoritesKey, favorites.toList());
  }

  static Future<Set<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesList = prefs.getStringList(_favoritesKey) ?? [];
    return favoritesList.toSet();
  }

  static Future<bool> isFavorite(String recipeId) async {
    final favorites = await getFavorites();
    return favorites.contains(recipeId);
  }
}

import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../data/local_data.dart';
import '../widgets/recipe_card.dart';
import '../widgets/category_chip.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Recipe> _allRecipes = LocalData.getRecipes();
  List<Recipe> _filteredRecipes = [];
  String _selectedCategory = 'Todos';

  @override
  void initState() {
    super.initState();
    _filteredRecipes = _allRecipes;
  }

  void _filterRecipes(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredRecipes = _allRecipes;
      } else {
        _filteredRecipes = _allRecipes
            .where(
              (recipe) =>
                  recipe.title.toLowerCase().contains(query.toLowerCase()) ||
                  recipe.description.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();
      }

      if (_selectedCategory != 'Todos') {
        _filteredRecipes = _filteredRecipes
            .where((recipe) => recipe.category == _selectedCategory)
            .toList();
      }
    });
  }

  void _filterByCategory(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'Todos') {
        _filteredRecipes = _allRecipes;
      } else {
        _filteredRecipes = _allRecipes
            .where((recipe) => recipe.category == category)
            .toList();
      }

      if (_searchController.text.isNotEmpty) {
        _filteredRecipes = _filteredRecipes
            .where(
              (recipe) =>
                  recipe.title.toLowerCase().contains(
                    _searchController.text.toLowerCase(),
                  ) ||
                  recipe.description.toLowerCase().contains(
                    _searchController.text.toLowerCase(),
                  ),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buscar Recetas')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar recetas...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: _filterRecipes,
            ),
          ),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: LocalData.getCategories()
                  .map(
                    (category) => CategoryChip(
                      label: category,
                      isSelected: _selectedCategory == category,
                      onSelected: () => _filterByCategory(category),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredRecipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(recipe: _filteredRecipes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

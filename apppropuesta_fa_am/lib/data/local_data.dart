import '../models/recipe.dart';

class LocalData {
  static List<Recipe> getRecipes() {
    return [
      Recipe(
        id: '1',
        title: 'Pasta Carbonara',
        description: 'Un clásico italiano cremoso y delicioso',
        imageUrl:
            'https://images.unsplash.com/photo-1621996346565-e3dbc353d2e5',
        ingredients: [
          '200g de spaghetti',
          '100g de pancetta',
          '2 huevos',
          '50g de queso pecorino',
          'Pimienta negra',
          'Sal',
        ],
        steps: [
          'Cocinar la pasta al dente',
          'Dorar la pancetta en una sartén',
          'Batir los huevos con el queso',
          'Mezclar todo y servir inmediatamente',
        ],
        cookingTime: 20,
        category: 'Plato Principal',
      ),
      Recipe(
        id: '2',
        title: 'Brownie de Chocolate',
        description: 'Postre de chocolate intenso y esponjoso',
        imageUrl:
            'https://images.unsplash.com/photo-1606313564200-e75d5e30476c',
        ingredients: [
          '200g de chocolate negro',
          '150g de mantequilla',
          '3 huevos',
          '200g de azúcar',
          '100g de harina',
          '50g de nueces',
        ],
        steps: [
          'Derretir chocolate y mantequilla',
          'Batir huevos con azúcar',
          'Mezclar todos los ingredientes',
          'Hornear a 180°C por 25 minutos',
        ],
        cookingTime: 40,
        category: 'Postre',
      ),
      Recipe(
        id: '3',
        title: 'Ensalada César',
        description: 'Ensalada fresca con aderezo cremoso',
        imageUrl: 'https://images.unsplash.com/photo-1546793665-c74683f339c1',
        ingredients: [
          '1 lechuga romana',
          '50g de queso parmesano',
          'Picatostes',
          'Pechuga de pollo',
          'Salsa César',
        ],
        steps: [
          'Lavar y cortar la lechuga',
          'Cocinar y cortar el pollo',
          'Mezclar todos los ingredientes',
          'Añadir aderezo y servir',
        ],
        cookingTime: 15,
        category: 'Ensalada',
      ),
    ];
  }

  static List<String> getCategories() {
    return [
      'Todos',
      'Plato Principal',
      'Postre',
      'Ensalada',
      'Sopa',
      'Aperitivo',
    ];
  }
}

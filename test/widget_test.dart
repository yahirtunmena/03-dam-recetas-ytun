import 'package:flutter_test/flutter_test.dart';
import 'package:recetas_app/models/recetas.dart';

void main() {
  test('parses recipe fields from the API', () {
    final receta = Receta.fromJson({
      'id': 1,
      'name': 'Sopa',
      'ingredients': <String>['agua'],
      'instructions': <String>['Hervir'],
      'prepTimeMinutes': 5,
      'cookTimeMinutes': 10,
      'servings': 2,
      'caloriesPerServing': 100,
      'image': 'https://example.com/sopa.jpg',
      'rating': 4.5,
    });

    expect(receta.nombre, 'Sopa');
    expect(receta.tiempoCoccion, 10);
    expect(receta.tiempoTotal, 15);
  });
}

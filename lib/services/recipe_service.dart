import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recetas_app/models/recetas.dart';

class RecipeService {
  final String baseUrl = 'https://dummyjson.com/recipes';

  Future<List<Receta>> getRecetas() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List recipesJson = data['recipes'];
      return recipesJson.map((json) => Receta.fromJson(json)).toList();
    } else {
      throw Exception('Fallo al cargar las recetas');
    }
  }
}
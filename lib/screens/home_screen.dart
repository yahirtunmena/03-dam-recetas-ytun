import 'package:flutter/material.dart';
import 'package:recetas_app/models/recetas.dart';
import 'package:recetas_app/services/recipe_service.dart';
import 'package:recetas_app/widgets/receta_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RecipeService _recipeService = RecipeService();
  late Future<List<Receta>> _futureRecetas;

  @override
  void initState() {
    super.initState();
    _futureRecetas = _recipeService.getRecetas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recetas del Mayab'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Receta>>(
        future: _futureRecetas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay recetas disponibles'));
          }

          final recetas = snapshot.data!;
          return ListView.builder(
            itemCount: recetas.length,
            itemBuilder: (context, index) {
              return RecetaCard(
                receta: recetas[index],
                onTap: () {
                  // Aquí puedes navegar al detalle si gustas
                },
              );
            },
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/models.dart';

class RecipesScreen extends StatelessWidget {
  RecipesScreen({Key? key}) : super(key: key);

  final exploreService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // 类似联调某个接口
        future: exploreService.getRecipes(),
        builder:
            (BuildContext context, AsyncSnapshot<List<SimpleRecipe>> data) {
          if (data.connectionState == ConnectionState.done) {
            return RecipesGridView(recipes: data.data ?? []);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

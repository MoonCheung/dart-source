import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

class RecipesGridView extends StatelessWidget {
  RecipesGridView({Key? key, required this.recipes}) : super(key: key);

  final List<SimpleRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: GridView.builder(
            itemCount: recipes.length,
            // 它使用此委托来控制其图块的布局
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              final simpleRecipe = recipes[index];
              // 食谱缩略图
              return RecipeThumbnail(recipe: simpleRecipe);
            }));
  }
}

import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  TodayRecipeListView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  final List<ExploreRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: new EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Recipes of the Day 🍳',
              style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 16),
          Container(
            height: 400,
            // TODO: Add ListView Here
            color: Colors.transparent,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return buildCard(recipe);
                },
                separatorBuilder: (context, index) {
                  // 用于每个列表之间分隔符设置
                  return const SizedBox(width: 16);
                }),
          ),
        ],
      ),
    );
  }

  // 自定义卡片小部件
  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This card doesn\'t exist yet');
    }
  }
}

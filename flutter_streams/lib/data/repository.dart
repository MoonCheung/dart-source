import 'models/models.dart';

abstract class Repository {
  Future<List<Recipe>> findAllRecipes();
  // 注意食谱列表的任何更改。例如，如果用户进行了新的搜索，它会更新食谱列表并相应地通知听众
  Stream<List<Recipe>> watchAllRecipes();
  // 侦听Groceries屏幕上显示的成分列表中的变化
  Stream<List<Ingredient>> watchAllIngredients();

  Future<Recipe> findRecipeById(int id);

  Future<List<Ingredient>> findAllIngredients();

  Future<List<Ingredient>> findRecipeIngredients(int recipeId);

  Future<int> insertRecipe(Recipe recipe);

  Future<List<int>> insertIngredients(List<Ingredient> ingredients);

  Future<void> deleteRecipe(Recipe recipe);

  Future<void> deleteIngredient(Ingredient ingredient);

  Future<void> deleteIngredients(List<Ingredient> ingredients);

  Future<void> deleteRecipeIngredients(int recipeId);

  Future init();
  void close();
}

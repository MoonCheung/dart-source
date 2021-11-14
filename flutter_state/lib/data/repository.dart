import 'models/models.dart';

//Dart 没有关键字 interface；相反，它使用abstract class. 这意味着您需要添加您希望所有存储库实现的方法
abstract class Repository {
  // TODO: Add find methods
  // 返回存储库中的所有配方。
  List<Recipe> findAllRecipes();
  // 通过 ID 查找特定配方。
  Recipe findRecipeById(int id);
  // 返回所有成分。
  List<Ingredient> findAllIngredients();
  // 查找给定配方 ID 的所有成分。
  List<Ingredient> findRecipeIngredients(int recipeId);

  // TODO: Add insert methods
  // 插入新配方
  int insertRecipe(Recipe recipe);
  // 添加所有给定的成分
  List<int> insertIngredients(List<Ingredient> ingredients);

  // TODO: Add delete methods
  // 删除给定的配方。
  void deleteRecipe(Recipe id);
  // 删除给定的成分
  void deleteIngredient(Ingredient ingredient);
  // 删除所有给定的成分
  void deleteIngredients(List<Ingredient> ingredients);
  // 删除给定配方 ID 的所有成分
  void deleteRecipeIngredients(int recipeId);

  // TODO: Add initializing and closing methods
  // 允许存储库初始化。数据库可能需要做一些启动工作
  Future init();
  // 关闭存储库
  void close();
}

import 'dart:core';
import 'package:flutter/foundation.dart';
// 1
import 'repository.dart';
// 2
import 'models/models.dart';

/**
 * MemoryRepository扩展Repository并使用 FlutterChangeNotifier来启用侦听器并将任何更改通知这些侦听器
 */
class MemoryRepository extends Repository with ChangeNotifier {
  // 初始化当前的食谱列表
  final List<Recipe> _currentRecipes = <Recipe>[];
  // 初始化当前的成分列表
  final List<Ingredient> _currentIngredients = <Ingredient>[];

  // TODO: Add find methods
  @override
  List<Recipe> findAllRecipes() {
    // 返回您当前的RecipeList
    return _currentRecipes;
  }

  @override
  Recipe findRecipeById(int id) {
    // 用于firstWhere查找具有给定 ID 的配方。
    return _currentRecipes.firstWhere((recipe) => recipe.id == id);
  }

  @override
  List<Ingredient> findAllIngredients() {
    // 返回您当前的成分列表。
    return _currentIngredients;
  }

  @override
  List<Ingredient> findRecipeIngredients(int recipeId) {
    // 查找具有给定 ID 的配方。
    final recipe =
        _currentRecipes.firstWhere((recipe) => recipe.id == recipeId);
    // 用于where查找具有给定配方 ID 的所有成分
    final recipeIngredients = _currentIngredients
        .where((ingredient) => ingredient.recipeId == recipe.id)
        .toList();
    return recipeIngredients;
  }

  // TODO: Add insert methods
  int insertRecipe(Recipe recipe) {
    //将食谱添加到您的列表中
    _currentRecipes.add(recipe);

    // 调用该方法以添加所有配方的成分。
    if (recipe.ingredients != null) {
      insertIngredients(recipe.ingredients!);
    }
    // 将更改通知所有侦听器。
    notifyListeners();
    // 返回新配方的 ID。因为你不需要它，它总是返回 0。
    return 0;
  }

  List<int> insertIngredients(List<Ingredient> ingredients) {
    // 检查以确保有一些成分。
    if (ingredients.length != 0) {
      // 将所有成分添加到您的列表中。
      _currentIngredients.addAll(ingredients);
      // 将更改通知所有侦听器。
      notifyListeners();
    }
    // 返回添加的 ID 列表。现在是一个空列表
    return <int>[];
  }

  // TODO: Add delete methods
  @override
  void deleteRecipe(Recipe recipe) {
    // 从列表中删除食谱。
    _currentRecipes.remove(recipe);
    // 删除此食谱的所有成分
    if (recipe.id != null) {
      deleteRecipeIngredients(recipe.id!);
    }
    // 通知所有侦听器数据已更改
    notifyListeners();
  }

  @override
  void deleteIngredient(Ingredient ingredient) {
    // 从列表中删除成分。
    _currentIngredients.remove(ingredient);
  }

  @override
  void deleteIngredients(List<Ingredient> ingredients) {
    // 删除传入列表中的所有成分
    _currentIngredients
        .removeWhere((ingredient) => ingredients.contains(ingredient));
    notifyListeners();
  }

  @override
  void deleteRecipeIngredients(int recipeId) {
    // 浏览所有成分并查找具有给定配方 ID 的成分，然后将其删除
    _currentIngredients
        .removeWhere((ingredient) => ingredient.recipeId == recipeId);
    notifyListeners();
  }

  @override
  Future init() {
    return Future.value(null);
  }

  @override
  void close() {}
}

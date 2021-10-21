import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'grocery_item.dart';

class GroceryManager extends ChangeNotifier {
  // 声明类型
  final _groceryItems = <GroceryItem>[];
  // 获取列表（外部实体只能读取杂货清单）
  List<GroceryItem> get groceryItems => List.unmodifiable(_groceryItems);
  // 删除特定索引处的项目
  void deleteItem(int index) {
    _groceryItems.removeAt(index);
    notifyListeners();
  }

  // 列表末尾添加一个新的杂货项目
  void addItem(GroceryItem item) {
    _groceryItems.add(item);
    notifyListeners();
  }

  // 新项目替换给定索引处的旧项目
  void updateItem(GroceryItem item, int index) {
    _groceryItems[index] = item;
    notifyListeners();
  }

  // 打开isComplete和关闭标志。
  void completeItem(int index, bool change) {
    final item = _groceryItems[index];
    _groceryItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}

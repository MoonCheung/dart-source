import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier {
  int selectedTab = 0;
  // 修改当前标签索引的简单函数
  void goToTab(index) {
    print('goToTab:${index}');
    selectedTab = index;
    notifyListeners();
  }

  // 设置selectedTab为Recipes选项卡的特定函数
  void goToRecipes() {
    selectedTab = 1;
    notifyListeners();
  }
}

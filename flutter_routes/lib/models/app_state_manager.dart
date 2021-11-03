import 'dart:async';
import 'package:flutter/material.dart';

class FooderlichTab {
  static const int explore = 0;
  static const int recipes = 1;
  static const int toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  int _selectedTab = FooderlichTab.explore;

  // 检查应用程序是否已初始化
  bool get isInitialized => _initialized;
  // 让您检查用户是否已登录
  bool get isLoggedIn => _loggedIn;
  // 检查用户是否完成了入职流程。
  bool get isOnboardingComplete => _onboardingComplete;
  // 跟踪用户所在的标签。
  int get getSelectedTab => _selectedTab;

  // 初始化应用程序
  void initializeApp() {
    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;
      notifyListeners();
    });
  }

  // 登录方法
  void login(String username, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  // 完成入职
  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  // 设置选定选项卡
  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  // 导航到食谱选项卡
  void goToRecipes() {
    _selectedTab = FooderlichTab.recipes;
    notifyListeners();
  }

  // 添加注销功能
  // 重置所有应用状态属性
  // 重新初始化应用程序
  // 通知所有监听器状态改变
  void logout() {
    _loggedIn = false;
    _onboardingComplete = false;
    _initialized = false;
    _selectedTab = 0;

    initializeApp();
    notifyListeners();
  }
}

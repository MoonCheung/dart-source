import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

// 系统将告诉路由器构建和配置导航器小部件
class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  // 整个应用程序中的唯一键
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  // 声明AppStateManager。路由器将侦听应用程序状态更改以配置导航器的页面列表
  final AppStateManager appStateManager;
  // 声明GroceryManager在您创建或编辑项目时监听用户的状态
  final GroceryManager groceryManager;
  // 声明ProfileManager 侦听用户配置文件状态
  final ProfileManager profileManager;

  AppRouter(
      {required this.groceryManager,
      required this.profileManager,
      required this.appStateManager})
      : navigatorKey = GlobalKey<NavigatorState>() {
    // TODO: Add Listeners
    // 确定应用程序的状态。它管理应用程序是否初始化登录以及用户是否完成了入职
    appStateManager.addListener(notifyListeners);
    // 管理杂货清单和商品选择状态
    groceryManager.addListener(notifyListeners);
    // 管理用户的个人资料和设置
    profileManager.addListener(notifyListeners);
  }

  // TODO: Dispose listeners
  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      // 8
      key: navigatorKey,
      // TODO: Add onPopPage
      onPopPage: _handlePopPage,
      // 9
      pages: [
        // TODO: Add SplashScreen
        if (!appStateManager.isInitialized) SplashScreen.page(),
        // TODO: Add LoginScreen
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
          LoginScreen.page(),
        // TODO: Add OnboardingScreen
        if (appStateManager.isLoggedIn && !appStateManager.isOnboardingComplete)
          OnboardingScreen.page(),
        // TODO: Add Home
        if (appStateManager.isOnboardingComplete)
          Home.page(appStateManager.getSelectedTab),
        // TODO: Create new item
        if (groceryManager.isCreatingNewItem)
          GroceryItemScreen.page(
            onCreate: (item) {
              // 3
              groceryManager.addItem(item);
            },
            onUpdate: (item, index) {
              // 4 No update
            },
          ),
        // TODO: Select GroceryItemScreen
        if (groceryManager.selectedIndex != -1)
          GroceryItemScreen.page(
              item: groceryManager.selectedGroceryItem,
              index: groceryManager.selectedIndex,
              onUpdate: (item, index) {
                // 3
                groceryManager.updateItem(item, index);
              },
              onCreate: (_) {}),
        // TODO: Add Profile Screen
        if (profileManager.didSelectUser)
          ProfileScreen.page(profileManager.getUser),
        // TODO: Add WebView Screen
        if (profileManager.didTapOnRaywenderlich) WebViewScreen.page(),
      ],
    );
  }

  // 处理路由事件
  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      // 4
      return false;
    }
    print('wich route ${route}');
    // 5
    // TODO: Handle Onboarding and splash
    if (route.settings.name == FooderlichPages.onboardingPath) {
      appStateManager.logout();
    }
    // TODO: Handle state when user closes grocery item screen
    if (route.settings.name == FooderlichPages.groceryItemDetails) {
      groceryManager.groceryItemTapped(-1);
    }
    // TODO: Handle state when user closes profile screen
    if (route.settings.name == FooderlichPages.profilePath) {
      profileManager.tapOnProfile(false);
    }
    // TODO: Handle state when user closes WebView screen
    if (route.settings.name == FooderlichPages.raywenderlich) {
      profileManager.tapOnRaywenderlich(false);
    }
    return true;
  }

  // 设置新路线路径
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}

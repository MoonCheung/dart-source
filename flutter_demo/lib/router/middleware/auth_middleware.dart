import 'package:flutter_demo/router/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 2;
  // 身份验证(暂时)
  bool isAuthenticated = false;

  // 函数将按此顺序调用：[redirect] -> [onPageCalled] -> [onBindingsStart] -> [onPageBuildStart] -> [onPageBuilt] -> [onPageDispose]
  @override
  RouteSettings? redirect(String? route) {
    // NOTE: 在这里无法获取Get路由参数信息
    debugPrint('=======AuthMiddleware.redirect:$route');
    // if (!isAuthenticated) {
    //   return RouteSettings(name: RouteName.getxcountbinding);
    // }
    return super.redirect(route);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    debugPrint('=======AuthMiddleware.onPageCalled:$page');
    return super.onPageCalled(page);
  }

  @override
  Widget onPageBuilt(Widget page) {
    debugPrint('=======AuthMiddleware.onPageBuilt:$page');
    return super.onPageBuilt(page);
  }
}

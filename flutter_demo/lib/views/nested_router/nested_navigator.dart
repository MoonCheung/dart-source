import 'package:flutter/material.dart';

// 封装无状态嵌套路由包装类
class NestedNavigator extends StatelessWidget {
  const NestedNavigator(
      {Key? key,
      required this.navigationKey, // 导航到小部件key
      required this.initialRoute, // 初始路由
      required this.routes}) // 路由表
      : super(key: key);
  final GlobalKey<NavigatorState> navigationKey;
  final String initialRoute;
  final Map<String, WidgetBuilder> routes;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Navigator(
          key: navigationKey,
          initialRoute: initialRoute,
          onGenerateRoute: (RouteSettings settings) {
            debugPrint('watch settings ${routes[settings.name]}, ${settings}');
            // WidgetBuilder builder = routes[settings.name]!;
            // if (settings.name == '/routes') {
            //   // flutter 路由小部件API
            //   return PageRouteBuilder(
            //     pageBuilder: (context, __, ___) => builder(context),
            //     settings: settings,
            //   );
            // } else {
            // material page route
            // return MaterialPageRoute(builder: builder, settings: settings);
            // }
          },
        ),
        onWillPop: () {
          if (navigationKey.currentState!.canPop()) {
            navigationKey.currentState!.pop();
            return Future<bool>.value(false);
          }
          return Future<bool>.value(true);
        });
  }
}

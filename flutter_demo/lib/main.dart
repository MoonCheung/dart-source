import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './router/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // 全局导航key
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        // navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false, // 隐藏调试横幅
        initialRoute: "/", //名为"/"的路由作为应用的home(首页),
        //注册路由表
        routes: CustomRoutes.routes,
        localizationsDelegates: const [
          // Material Components库提供了本地化的字符串和其他值
          GlobalMaterialLocalizations.delegate,
          // 定义widget默认的文本方向，从左到右或从右到左。
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('zh', 'CH'), // 中文
        ],
        // 主题色配置
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}

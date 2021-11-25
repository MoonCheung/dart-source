import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false, // 隐藏调试横幅
        initialRoute: "/", //名为"/"的路由作为应用的home(首页),
        //注册路由表
        routes: {
          "/": (context) => const Home(
              title: 'Flutter Demo Home Page'), //注册首页路由,如添加此属性之后该去掉home属性
        },
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

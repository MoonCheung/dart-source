import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart'; // getx 状态管理
import 'package:provider/provider.dart'; // 继承小部件 很简单
import 'package:flutter_demo/router/index.dart';

import '../views/provider/model/post_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false, // 隐藏调试横幅
        initialRoute: RouteConfig.main,
        getPages: RouteConfig.getPage,
        navigatorObservers: [GetObserver()],
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
        ),
        builder: _builder);
  }

  // 独立处理全局 Bloc 和 Provider
  Widget _builder(BuildContext context, Widget? child) {
    // Provider 类
    // 在添加MultiProvider()小部件之后，再次添加ChangeNotifierProvider()小部件
    return MultiProvider(providers: [
      ChangeNotifierProvider<PostProvider>(
        create: (context) => PostProvider(),
      ),
    ], child: child);
  }

  // 自定义的一些全局控件
  // TODO: 暂时还没创建ChangeNotifierEasyP class类
  // Widget _customGlobalWidget(Widget? child) {
  //   return ChangeNotifierEasyP(
  //     create: (BuildContext context) => CounterGlobalEasyP(),
  //     child: child,
  //   );
  // }
}

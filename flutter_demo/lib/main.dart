import 'package:flutter/material.dart';
import 'package:get/get.dart'; // getx 状态管理
import 'package:provider/provider.dart'; // provider 状态管理 很简单
import 'package:easy_localization/easy_localization.dart'; // i18n 国际化
import 'package:flutter_demo/router/app_page.dart';

import 'package:flutter_demo/views/provider/provider_data/model/post_provider.dart';
import 'package:flutter_demo/views/provider/count_simple/logic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('zh'), Locale('en')],
      path: 'assets/lang', // <-- 更改翻译文件的路径
      fallbackLocale: const Locale('zh'),
      startLocale: const Locale('zh'),
      child: const MyApp()));
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
        // key: ValueKey('${context.locale}'),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false, // 隐藏调试横幅
        initialRoute: RouteName.main,
        getPages: RouteConfig.getPage,
        navigatorObservers: [GetObserver()],
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
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
      ChangeNotifierProvider<ChangeNotifierController>(
        create: (context) => ChangeNotifierController(),
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

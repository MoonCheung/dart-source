import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'fooderlich_theme.dart';
import 'models/models.dart';
import 'home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 隐藏调试横幅
      theme: theme,
      title: 'Fooderlich',
      localizationsDelegates: [
        // Material Components库提供了本地化的字符串和其他值
        GlobalMaterialLocalizations.delegate,
        // 定义widget默认的文本方向，从左到右或从右到左。
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'), // 中文
      ],
      // TODO 8: Replace Home with MultiProvider
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          // TODO 10: Add GroceryManager Provider
          ChangeNotifierProvider(create: (context) => GroceryManager())
        ],
        child: const Home(),
      ),
    );
  }
}

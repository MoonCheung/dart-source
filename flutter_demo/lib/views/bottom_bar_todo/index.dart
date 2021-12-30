import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import './router.dart';

// 借鉴参考：https://ithelp.ithome.com.tw/articles/10260095
class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: MyRouter.generateRoute,
        // initialRoute: FirebaseAuth.instance.currentUser ==null? RouteName.loginScreen:RouteName.homePage
        initialRoute: RouteName.bottomBar);
  }
}

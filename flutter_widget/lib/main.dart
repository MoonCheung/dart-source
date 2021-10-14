import 'package:flutter/material.dart';
import './fooderlich_theme.dart';
import './home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // 此小部件是应用的根源
  @override
  Widget build(BuildContext context) {
    // TODO: Create theme
    final theme = FooderlichTheme.dark();

    // TODO: Apply Home widget
    return MaterialApp(
      title: 'Fooderlich',
      theme: theme,
      // Scaffold: 脚手架
      home: const Home(),
    );
  }
}

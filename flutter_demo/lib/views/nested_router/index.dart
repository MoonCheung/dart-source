import 'package:flutter/material.dart';
import './nested_navigator.dart';

import './pages/pages.dart';

class NestedPage extends StatefulWidget {
  NestedPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<NestedPage> createState() => _NestedPageState();
}

class _NestedPageState extends State<NestedPage> {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        height: 72,
        color: Colors.cyanAccent,
        padding: const EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('改变内部路径:'),
            ElevatedButton(
              onPressed: () {
                while (navigationKey.currentState!.canPop()) {
                  navigationKey.currentState!.pop();
                }
              },
              child: const Text('to Root'),
            ),
            // 扩展小部件
            Expanded(
                child: NestedNavigator(
              navigationKey: navigationKey,
              initialRoute: '/routes',
              routes: {
                // default rout as '/' is necessary!
                '/routes': (context) => PageOne(),
                '/two': (context) => PageTwo(),
                '/three': (context) => PageThree(),
              },
            ))
          ],
        ),
      ),
    );
  }
}

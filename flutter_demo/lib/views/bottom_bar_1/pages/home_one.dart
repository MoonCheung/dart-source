import 'package:flutter/material.dart';

class HomeOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Home One'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home_two');
              },
              child: Text('跳转到 Home Two'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: 当前页面跳转到别的指定页面，连底部标签栏该激活～，暂时没实现
                Navigator.pushNamed(context, '/setting_two');
              },
              child: Text('跳转到 Setting Two'),
            ),
          ],
        ),
      ),
    );
  }
}

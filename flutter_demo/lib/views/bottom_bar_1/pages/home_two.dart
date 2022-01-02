import 'package:flutter/material.dart';

class HomeTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Home Two'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home_three');
              },
              child: const Text('跳转到 Home Three'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('go to back'),
            ),
          ],
        ),
      ),
    );
  }
}

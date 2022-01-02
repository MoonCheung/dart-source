import 'package:flutter/material.dart';

class SettingTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Setting Two'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/setting_three');
              },
              child: const Text('跳转到 Setting Three'),
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

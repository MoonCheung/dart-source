import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Page Two'),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/three');
              },
              child: const Text('go to next'),
            ),
            TextButton(
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

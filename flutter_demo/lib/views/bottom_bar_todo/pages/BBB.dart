import 'package:flutter/material.dart';

import '../router.dart';

class BBB extends StatelessWidget {
  const BBB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: InkWell(
        onTap: () => Navigator.pushNamed(context, RouteName.bottomBar),
        child: Center(
          child: Text(
            'Page A',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

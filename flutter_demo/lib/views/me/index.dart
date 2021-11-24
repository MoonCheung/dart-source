import 'package:flutter/material.dart';

class Me extends StatelessWidget {
  const Me({Key? key}) : super(key: key);
  // final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Center(child: const Text('这是我的!!', style: TextStyle(fontSize: 24))),
    );
  }
}

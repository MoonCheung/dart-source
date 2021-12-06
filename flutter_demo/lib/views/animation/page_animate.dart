import 'package:flutter/material.dart';

class PageAnimate extends StatelessWidget {
  const PageAnimate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      child: Center(
        child: Row(
          children: <Widget>[
            Hero(
                tag: 'hero',
                child:
                    Container(width: 100, height: 100, child: FlutterLogo())),
            Text('点击Logo查看Hero效果')
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => HeroPage()));
      },
    ));
  }
}

class HeroPage extends StatelessWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hero 放大器')),
        body: Hero(
            tag: 'hero',
            child: Center(
                child:
                    Container(width: 300, height: 300, child: FlutterLogo()))));
  }
}

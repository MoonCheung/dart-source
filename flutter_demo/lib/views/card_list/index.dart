import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    final routePath = ModalRoute.of(context)?.settings.arguments;
    print('示演页面->路由信息:${routePath}');
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: GridView.count(
          crossAxisSpacing: 10, // 交叉轴间距
          mainAxisSpacing: 10, // 主轴间距
          crossAxisCount: 3, // 横轴数量
          children: <Widget>[
            Card(
              child: InkWell(
                  onTap: () {
                    print("触摸开始：Card Clicked");
                    // 或者路由导航静态方法也可以
                    Navigator.of(context).pushNamed('/count', arguments: {
                      'title': 'Card 回来了！',
                    });
                  },
                  child: const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Center(child: Text('计数器')))),
              color: Colors.teal[100],
            ),
            Card(
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/scrolllist');
                  },
                  child: const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Center(child: Text('滚动视图')))),
              color: Colors.teal[200],
            ),
            Card(
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/groupOrdraw');
                  },
                  child: const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Center(child: Text('组合/自绘')))),
              color: Colors.teal[300],
            ),
            Card(
              child: const Text('Who scream'),
              color: Colors.teal[400],
            ),
            Card(
              child: const Text('Revolution is coming...'),
              color: Colors.teal[500],
            ),
            Card(
              child: const Text('Revolution, they...'),
              color: Colors.teal[600],
            ),
          ],
        ));
  }
}

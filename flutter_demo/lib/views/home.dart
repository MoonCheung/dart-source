import 'package:flutter/material.dart';

import 'card_list/index.dart';
import 'me/index.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 创建索引值：0
  int _selectedIndex = 0;

  // Widget列表
  static List<Widget> pages = <Widget>[const CardList(), const Me()];

  // 标签选项卡
  final List<BottomNavigationBarItem> items = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          size: 30.0,
        ),
        label: '演示'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.perm_identity,
          size: 30.0,
        ),
        label: '我'),
  ];

  // 改变底部标签栏方法
  void handleItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Flutter Demo',
                // 使用Theme.of静态方法获取主题色配置
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            body: pages[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor:
                  Theme.of(context).textSelectionTheme.selectionColor,
              currentIndex: _selectedIndex,
              onTap: handleItemTapped,
              items: items,
              // NOTE：BottomNavigationBar小部件不能使用以下属性
              // unselectedLabelColor: Colors.blueGrey,
              // labelColor: Colors.blue,
              // indicatorSize: TabBarIndicatorSize.label,
              // indicatorColor: Colors.blue,
            )));
  }
}

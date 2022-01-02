import 'package:flutter/material.dart';
import '../views/home.dart';
import '../views/count/index.dart';
import '../views/scrollview/index.dart';
import '../views/gourpordraw/index.dart';
import '../views/gesture/index.dart';
import '../views/data_transfer/index.dart';
import '../views/animation/index.dart';
import '../views/async/index.dart';
import '../views/network/index.dart';
import '../views/bottom_bar/index.dart';
import '../views/bottom_bar_1/index.dart';
import '../views/nested_router/index.dart';
import '../views/nested_router/pages/pages.dart';

// NOTE：路由配置API的用法
// Navigator 声明式导航2.0
// Navigator.pushNamed(context, '路由路径', arguments: {});
// 或者路由导航静态方法也可以
// Navigator.of(context).pushNamed('路由路径', arguments: { });

// Navigator 命令式1.0，有2个API: push()、pop()
// Navigator.push(context,MaterialPageRoute(builder: (context) => const Count(title: '计数器')));

// 获取路由参数
// ModalRoute.of(context)?.settings.arguments;

// 路由配置
class CustomRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    "/": (BuildContext context) => const Home(
          title: 'Flutter Demo Home Page',
        ),
    '/count': (BuildContext context) => const Count(title: '计数器'),
    '/scrolllist': (BuildContext context) => const ScrollList(title: '滚动视图'),
    '/groupOrdraw': (BuildContext context) =>
        const GourpOrDraw(title: '组合Or自绘'),
    '/gesture': (BuildContext context) => const GestureView(title: '手势事件'),
    '/data': (BuildContext context) => const DataTransfers(title: '数据通信'),
    '/animation': (BuildContext context) =>
        const AnimatioWidget(title: 'Futter 动画'),
    '/async': (BuildContext context) => const AsyncAwait(title: 'Async'),
    '/network': (BuildContext context) => const NetworkState(title: 'Network'),
    '/bottom_bar': (BuildContext context) => const BottomBar(title: '动画底部导航'),
    '/bottom_bar_1': (BuildContext context) =>
        const BottomBarPage(title: '底部导航（行为分析）'),
    '/routes': (BuildContext context) => NestedPage(title: '嵌套路由'),
  };
}

import 'package:flutter_demo/views/home.dart';
import 'package:flutter_demo/views/animation/index.dart';
import 'package:flutter_demo/views/async/index.dart';
import 'package:flutter_demo/views/bottom_bar/index.dart';
import 'package:flutter_demo/views/bottom_bar_1/index.dart';
import 'package:flutter_demo/views/count/index.dart';
import 'package:flutter_demo/views/data_transfer/index.dart';
import 'package:flutter_demo/views/gesture/index.dart';
import 'package:flutter_demo/views/getx/index.dart';
import 'package:flutter_demo/views/gourpordraw/index.dart';
import 'package:flutter_demo/views/i18ns/index.dart';
import 'package:flutter_demo/views/json_article/index.dart';
import 'package:flutter_demo/views/nested_router/index.dart';
import 'package:flutter_demo/views/network/index.dart';
import 'package:flutter_demo/views/provider/index.dart';
import 'package:flutter_demo/views/scrollview/index.dart';

import 'package:get/get.dart';

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
class RouteConfig {
  // 主页面
  static const String main = '/';
  // 计数器
  static const String count = '/count';
  // 滚动视图
  static const String scrolllist = '/scrolllist';
  // 组合Or自绘
  static const String groupOrdraw = '/groupOrdraw';
  // 手势事件
  static const String gesture = '/gesture';
  // 数据通信
  static const String data = '/data';
  // flutter 动画
  static const String animations = '/animation';
  // async
  static const String asyncs = '/async';
  // Network
  static const String network = '/network';
  // 底部导航栏
  static const String bottomBar = '/bottom_bar';
  // 底部导航栏
  static const String bottomBar1 = '/bottom_bar_1';
  // 嵌套路由
  static const String nestedRoute = '/routes';
  // i18n 多国语系
  static const String i18ns = '/i18ns';
  // json 物件教学
  static const String jsons = '/jsons';
  // provider 继承小部件
  static const String provider = '/provider';
  // getx
  static const String getx = '/getx';

  // 别名映射路由页面
  static final List<GetPage> getPage = [
    GetPage(
        name: main, page: () => const Home(title: 'Flutter Demo Home Page')),
    GetPage(name: count, page: () => const Count(title: '计数器')),
    GetPage(name: scrolllist, page: () => const ScrollList(title: '滚动视图')),
    GetPage(name: groupOrdraw, page: () => const GourpOrDraw(title: '组合Or自绘')),
    GetPage(name: gesture, page: () => const GestureView(title: '手势事件')),
    GetPage(name: data, page: () => const DataTransfers(title: '数据通信')),
    GetPage(
        name: animations, page: () => const AnimatioWidget(title: 'Futter 动画')),
    GetPage(name: asyncs, page: () => const AsyncAwait(title: 'Async')),
    GetPage(name: network, page: () => const NetworkState(title: 'Network')),
    GetPage(name: bottomBar, page: () => const BottomBar(title: '动画底部导航')),
    GetPage(
        name: bottomBar1, page: () => const BottomBarPage(title: '底部导航（行为分析）')),
    GetPage(
      name: nestedRoute,
      page: () => NestedPage(title: '嵌套路由'),
    ),
    GetPage(
      name: i18ns,
      page: () => const i18nsPage(title: '多国语系'),
    ),
    GetPage(
      name: jsons,
      page: () => const JsonAtricle(title: 'Json 物件教学'),
    ),
    GetPage(
      name: provider,
      page: () => const ProviderPage(title: 'Flutter Provider'),
    ),
    GetPage(
      name: getx,
      page: () => const GetxPages(title: 'Flutter Getx'),
    ),
  ];
}

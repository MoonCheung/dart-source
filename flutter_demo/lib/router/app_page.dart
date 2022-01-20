import 'package:flutter_demo/views/home.dart';
import 'package:flutter_demo/views/animation/index.dart';
import 'package:flutter_demo/views/async/index.dart';
import 'package:flutter_demo/views/bottom_bar/index.dart';
import 'package:flutter_demo/views/bottom_bar_1/index.dart';
import 'package:flutter_demo/views/count/index.dart';
import 'package:flutter_demo/views/data_transfer/index.dart';
import 'package:flutter_demo/views/gesture/index.dart';
import 'package:flutter_demo/views/gourpordraw/index.dart';
import 'package:flutter_demo/views/i18ns/index.dart';
import 'package:flutter_demo/views/json_article/index.dart';
import 'package:flutter_demo/views/nested_router/index.dart';
import 'package:flutter_demo/views/network/index.dart';
import 'package:flutter_demo/views/provider/index.dart';
import 'package:flutter_demo/views/scrollview/index.dart';
import 'package:flutter_demo/views/getx/router.dart';

import 'package:get/get.dart';

part 'app_routes.dart';

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
  // 别名映射路由页面
  static final List<GetPage> getPage = [
    GetPage(
        name: RouteName.main,
        page: () => const Home(title: 'Flutter Demo Home Page')),
    GetPage(name: RouteName.count, page: () => const Count(title: '计数器')),
    GetPage(
        name: RouteName.scrolllist,
        page: () => const ScrollList(title: '滚动视图')),
    GetPage(
        name: RouteName.groupOrdraw,
        page: () => const GourpOrDraw(title: '组合Or自绘')),
    GetPage(
        name: RouteName.gesture, page: () => const GestureView(title: '手势事件')),
    GetPage(
        name: RouteName.data, page: () => const DataTransfers(title: '数据通信')),
    GetPage(
        name: RouteName.animations,
        page: () => const AnimatioWidget(title: 'Futter 动画')),
    GetPage(
        name: RouteName.asyncs, page: () => const AsyncAwait(title: 'Async')),
    GetPage(
        name: RouteName.network,
        page: () => const NetworkState(title: 'Network')),
    GetPage(
        name: RouteName.bottomBar,
        page: () => const BottomBar(title: '动画底部导航')),
    GetPage(
        name: RouteName.bottomBar1,
        page: () => const BottomBarPage(title: '底部导航（行为分析）')),
    GetPage(
      name: RouteName.nestedRoute,
      page: () => NestedPage(title: '嵌套路由'),
    ),
    GetPage(
      name: RouteName.i18ns,
      page: () => const i18nsPage(title: '多国语系'),
    ),
    GetPage(
      name: RouteName.jsons,
      page: () => const JsonAtricle(title: 'Json 物件教学'),
    ),
    GetPage(
      name: RouteName.provider,
      page: () => const ProviderPage(title: 'Flutter Provider'),
    ),

    // getx 状态管理页面
    GetPage(name: RouteName.getx, page: () => GetxPages(title: 'Flutter Getx'),
        // preventDuplicates: false,
        children: [
          GetPage(
            name: RouteName.getxcountsimple,
            page: () => GetxCountPage(),
          ),
          GetPage(
            name: RouteName.getxcountsrx,
            page: () => GetxCountReactivePage(),
          ),
          GetPage(
            name: RouteName.getxcountadvance,
            page: () => GetxCountAdvancePage(),
          ),
          GetPage(
              name: RouteName.getxcountbinding,
              page: () => GetxCountBindingPage(),
              // NOTE：在某个class扩展bindings类之后, 使用GetCounterBinding 实例类
              binding: GetCounterBinding()),
          // NOTE：不再扩展bindings类，可以使用下面BindingsBuilder()方法
          // binding: BindingsBuilder(
          //     () => Get.lazyPut(() => CounterBindingController())))
          GetPage(
            name: RouteName.getxacrossone,
            page: () => AcrossOnePage(title: '跨页面:One'),
          ),
          GetPage(
            name: RouteName.getxacrosstwo,
            page: () => AcrossTwoPage(title: '跨页面:Two'),
          ),
        ]),
  ];
}

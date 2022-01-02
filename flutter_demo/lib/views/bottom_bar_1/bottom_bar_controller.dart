import 'package:flutter/material.dart';
import './pages/pages.dart';

class BottomBarController extends ChangeNotifier {
  // 声明数组类型 导航页面
  late final List<NavigatorPage> _navPages;
  // 获取导航页面
  List<NavigatorPage> get navPages => _navPages;
  // 整型类型 当前标签栏的索引
  int _currentTab = 0;
  // 获取当前标签栏的索引
  int get currentTab => _currentTab;

  NavigatorPage get currentNavigatorPage => navPages[_currentTab];

  void init() {
    _navPages = [
      NavigatorPage(routes: HomeRoute(), navLabel: '图书馆', navIcon: Icons.home),
      NavigatorPage(
          routes: SettingRoute(), navLabel: '设置', navIcon: Icons.settings)
    ];
  }

  void changeTab(int index) {
    // debugPrint('watch index:${index}');
    _currentTab = index;
    notifyListeners();
  }
}

// 定义导航页面抽象类
class NavigatorPage {
  final Routes routes;
  final IconData navIcon;
  final String navLabel;
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  NavigatorPage(
      {required this.routes, required this.navIcon, required this.navLabel});
}

// 定义路由抽象类
abstract class Routes {
  Route<dynamic> getRoute(RouteSettings settings);
}

class HomeRoute implements Routes {
  @override
  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeOne());
      case '/home_two':
        return MaterialPageRoute(builder: (context) => HomeTwo());
      case '/home_three':
        return MaterialPageRoute(builder: (context) => HomeThree());
      case '/setting_two':
        return MaterialPageRoute(builder: (context) => SettingTwo());
      default:
        return MaterialPageRoute(
            builder: (_) => Container(
                  child: Center(
                    child: Text('${settings.name} 不存在'),
                  ),
                ));
    }
  }
}

class SettingRoute implements Routes {
  @override
  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SettingOne());
      case '/setting_two':
        return MaterialPageRoute(builder: (context) => SettingTwo());
      case '/setting_three':
        return MaterialPageRoute(builder: (context) => SettingThree());
      case '/home_two':
        return MaterialPageRoute(builder: (context) => HomeTwo());
      default:
        return MaterialPageRoute(
            builder: (_) => Container(
                  child: Center(
                    child: Text('${settings.name} 不存在'),
                  ),
                ));
    }
  }
}

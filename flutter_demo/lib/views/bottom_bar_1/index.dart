import 'package:flutter/material.dart';
import './bottom_bar_controller.dart';
import './bottom_bar_widget.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  @override
  Widget build(BuildContext context) {
    final bottomController = BottomBarController()..init(); // 级联调用其方法

    return WillPopScope(
      onWillPop: () async {
        NavigatorState? currentNavState =
            bottomController.currentNavigatorPage.navKey.currentState;
        if (currentNavState?.canPop() ?? true) {
          currentNavState?.pop();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: AnimatedBuilder(
            animation: bottomController,
            builder: (context, child) {
              return IndexedStack(
                index: bottomController.currentTab,
                children: bottomController.navPages
                    .map((page) => Navigator(
                          key: page.navKey,
                          onGenerateRoute: page.routes.getRoute,
                        ))
                    .toList(),
              );
            }),
        bottomNavigationBar: BottomBarWidget(
          bottomController: bottomController,
        ),
      ),
    );
  }
}

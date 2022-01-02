import 'package:flutter/material.dart';
import './bottom_bar_controller.dart';

class BottomBarWidget extends StatelessWidget {
  final BottomBarController bottomController;

  BottomBarWidget({Key? key, required this.bottomController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: bottomController,
        builder: (context, child) {
          return BottomNavigationBar(
              onTap: (index) {
                bottomController.changeTab(index);
              },
              currentIndex: bottomController.currentTab,
              items: bottomController.navPages
                  .map((page) => BottomNavigationBarItem(
                      icon: Icon(page.navIcon), label: page.navLabel))
                  .toList());
        });
  }
}

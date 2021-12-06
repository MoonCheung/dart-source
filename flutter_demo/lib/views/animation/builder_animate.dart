import 'dart:math';

import 'package:flutter/material.dart';

class BuilderAnimate extends StatefulWidget {
  const BuilderAnimate({Key? key}) : super(key: key);

  @override
  State<BuilderAnimate> createState() => _BuilderAnimateState();
}

class _BuilderAnimateState extends State<BuilderAnimate>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController controller;
  late Animation<double> animation;

  // 初始化状态
  @override
  void initState() {
    super.initState();
    // 创建动画周期为1秒的AnimationController对象
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.elasticOut);

    // 创建从50到200线性变化的Animation对象
    // 普通动画需要手动监听动画状态，刷新UI
    animation = Tween(begin: 50.0, end: 200.0).animate(curve)
      ..addListener(() => setState(() {}));

    // 启动动画
    controller.repeat(reverse: true);
  }

  // 销毁该类
  @override
  void dispose() {
    super.dispose();
    // 销毁动画方法
    controller.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        body: Center(
            child: AnimatedBuilder(
                animation: animation,
                // child:
                builder: (context, child) => Container(
                      width: animation.value,
                      height: animation.value,
                      child: const FlutterLogo(),
                    ))));
  }
}

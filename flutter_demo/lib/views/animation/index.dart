import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import 'builder_animate.dart';
import 'normal_animate.dart';
import 'page_animate.dart';
import 'widget_animate.dart';

class AnimatioWidget extends StatefulWidget {
  const AnimatioWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AnimatioWidgetState createState() => _AnimatioWidgetState();
}

class _AnimatioWidgetState extends State<AnimatioWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(title: Text(widget.title)),
            body: const TabBarView(children: <Widget>[
              NormalAnimate(),
              BuilderAnimate(),
              WidgetAnimate(),
              PageAnimate()
            ]),
            bottomNavigationBar: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "普通动画",
                ),
                Tab(
                  icon: Icon(Icons.rss_feed),
                  text: "Builder动画",
                ),
                Tab(
                  icon: Icon(Icons.perm_identity),
                  text: "Widget动画",
                ),
                Tab(icon: Icon(Icons.message), text: 'hero动画')
              ],
              unselectedLabelColor: Colors.blueGrey,
              labelColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.red,
            )));
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

import './model.dart';

class GourpOrDraw extends StatefulWidget {
  const GourpOrDraw({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<GourpOrDraw> createState() => _GourpOrDrawState();
}

class _GourpOrDrawState extends State<GourpOrDraw>
    with SingleTickerProviderStateMixin {
  //使用控制Tabbar切换
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.system_update), text: "组合"),
            Tab(icon: Icon(Icons.cake), text: "自绘")
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ListView(
            children: <Widget>[
              UpdatedItemWidget(
                model: UpdatedItemModel(
                    appIcon: "assets/icon.png",
                    appDescription:
                        "Thanks for using Google Maps! This release brings bug fixes that improve our product to help you discover new places and navigate to them.",
                    appName: "Google Maps - Transit & Fond",
                    appSize: "137.2",
                    appVersion: "Version 5.19",
                    appDate: "2019年6月5日"),
                onPressed: () {},
              )
            ],
          ),
          Center(child: Cake())
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}

class UpdatedItemWidget extends StatelessWidget {
  UpdatedItemWidget({Key? key, required this.model, required this.onPressed})
      : super(key: key);

  final UpdatedItemModel model;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    //组合上下两部分
    return Column(
        children: <Widget>[buildTopRow(context), buildBottomRow(context)]);
  }

  //创建上半部分
  Widget buildTopRow(BuildContext context) {
    return Row(children: <Widget>[
      Padding(
          padding: EdgeInsets.all(10.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(model.appIcon, width: 80, height: 80))),
      Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Text(
              model.appName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20, color: Color(0xFF8E8D92)),
            ),
            Text(
              "${model.appDate}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, color: Color(0xFF8E8D92)),
            )
          ])),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: TextButton(
          child: const Text(
            "OPEN",
            style: TextStyle(
                color: Color(0xFF007AFE), fontWeight: FontWeight.bold),
          ),
          onPressed: onPressed,
        ),
      )
    ]);
  }

  //创建下半部分
  Widget buildBottomRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(model.appDescription),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("${model.appVersion} • ${model.appSize} MB"))
            ]));
  }
}

class Cake extends StatelessWidget {
  const Cake({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: WheelPainter(),
    );
  }
}

class WheelPainter extends CustomPainter {
  //设置画笔颜色
  Paint getColoredPaint(Color color) {
    Paint paint = Paint();
    paint.color = color;
    return paint;
  }

  @override
  paint(Canvas canvas, Size size) {
    //饼图尺寸
    double wheelSize = min(size.width, size.height) / 2;
    double nbElem = 6;
    double radius = (2 * pi) / nbElem;
    Rect boundingRect = Rect.fromCircle(
        center: Offset(wheelSize, wheelSize), radius: wheelSize);

    //画圆弧，每次1/6个圆弧
    canvas.drawArc(
        boundingRect, 0, radius, true, getColoredPaint(Colors.orange));
    canvas.drawArc(
        boundingRect, radius, radius, true, getColoredPaint(Colors.black38));
    canvas.drawArc(
        boundingRect, radius * 2, radius, true, getColoredPaint(Colors.green));
    canvas.drawArc(
        boundingRect, radius * 3, radius, true, getColoredPaint(Colors.red));
    canvas.drawArc(
        boundingRect, radius * 4, radius, true, getColoredPaint(Colors.blue));
    canvas.drawArc(
        boundingRect, radius * 5, radius, true, getColoredPaint(Colors.pink));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

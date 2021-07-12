import 'package:flutter/material.dart';

class List extends StatelessWidget {
  List({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            body: TabBarView(
              children: [
                ParallelWidget(),
                ScrollNotificationWidget(),
                ScrollControllerWidget()
              ],
            ),
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(
                    icon: Icon(
                      Icons.home,
                      size: 30.0,
                    ),
                    text: "视差"),
                Tab(
                    icon: Icon(
                      Icons.rss_feed,
                      size: 30.0,
                    ),
                    text: '通知'),
                Tab(
                    icon: Icon(
                      Icons.perm_identity,
                      size: 30.0,
                    ),
                    text: '实例')
              ],
              unselectedLabelColor: Colors.blueGrey,
              labelColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.red,
            )));
  }
}

class ParallelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        //SliverAppBar 作为头图控件
        title: Text('自定义滚动视图'), // 标题
        floating: true, // 设置悬浮样式
        flexibleSpace: Image.network(
            "https://media-cdn.tripadvisor.com/media/photo-s/13/98/8f/c2/great-wall-hiking-tours.jpg",
            fit: BoxFit.cover), // 设置悬浮头图背景
        expandedHeight: 280, // 头图控件高度
      ),
      SliverList(
        //SliverList 作为列表控件
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(title: Text('列表 #$index')), // 列表项创建方法
          childCount: 100, // 列表元素个数
        ),
      )
    ]);
  }
}

class ScrollNotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('通知')),
        body: NotificationListener<ScrollNotification>(
          // 添加 NotificationListener 作为父容器
          onNotification: (scrollNotification) {
            // 注册通知回调
            if (scrollNotification is ScrollStartNotification) {
              // 滚动开始
              print('Scroll Start');
            } else if (scrollNotification is ScrollUpdateNotification) {
              // 滚动位置更新
              print('Scroll Update');
            } else if (scrollNotification is ScrollEndNotification) {
              // 滚动结束
              print('Scroll End');
            }
          },
          child: ListView.builder(
              itemCount: 30, // 列表元素个数
              itemBuilder: (context, index) =>
                  ListTile(title: Text("索引值: $index")) // 列表项创建方法
              ),
        ));
  }
}

class ScrollControllerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScrollControllerState();
}

class ScrollControllerState extends State<ScrollControllerWidget> {
  // NOTE: 可以用ScrollController _controller
  var _controller; //ListView 控制器
  bool isToTop = false; // 标示目前是否需要启用 "Top" 按钮

  @override
  void initState() {
    _controller = ScrollController();
    // 注册监听事件方法
    _controller.addListener(() {
      // 为控制器注册滚动监听方法
      if (_controller.offset > 1000) {
        // 如果 ListView 已经向下滚动了 1000，则启用 Top 按钮
        setState(() {
          isToTop = true;
        });
      } else if (_controller.offset < 300) {
        // 如果 ListView 向下滚动距离不足 300，则禁用 Top 按钮
        setState(() {
          isToTop = false;
        });
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("实例")),
        body: Column(children: <Widget>[
          Container(
              height: 40.0,
              width: 200,
              child: ElevatedButton(
                onPressed: (isToTop
                    ? () {
                        if (isToTop) {
                          _controller.animateTo(.0,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.ease); // 做一个滚动到顶部的动画
                        }
                      }
                    : null),
                child: Text("Top"),
              )),
          Expanded(
            child: ListView.builder(
              controller: _controller, // 初始化传入控制器
              itemCount: 100, // 列表元素总数
              itemBuilder: (context, index) =>
                  ListTile(title: Text("索引值: $index")), // 列表项构造方法
            ),
          ),
        ]));
  }
}

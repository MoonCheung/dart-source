import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();

  late ScrollController _controller;

  @override
  void initState() {
    // 滚动控制器
    _controller = ScrollController();
    // 注册事件方法
    _controller.addListener(_scrollListenter);
    super.initState();
  }

  // 自定义事件方法
  void _scrollListenter() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print('reached the bottom ${_controller.position}');
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print('reached the top! ${_controller.position}');
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListenter);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 2
    // TODO 1: Add TodayRecipeListView FutureBuilder
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> data) {
          // TODO: Add Nested List Views
          // 4
          if (data.connectionState == ConnectionState.done) {
            final recipes = data.data?.todayRecipes ?? [];
            // TODO: Replace this with TodayRecipeListView
            return ListView(
                controller: _controller,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  TodayRecipeListView(recipes: recipes),
                  new SizedBox(height: 16),
                  // TODO: Replace this with FriendPostListView
                  FriendPostListView(friendPosts: data.data?.friendPosts ?? []),
                ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

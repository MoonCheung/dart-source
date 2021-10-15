import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/models.dart';

// 模拟配方服务，抓住样品 json 数据来模拟配方请求/响应
class MockFooderlichService {
  // 批次请求，获得今天的食谱和朋友的饲料
  Future<ExploreData> getExploreData() async {
    final todayRecipes = await _getTodayRecipes();
    final friendPosts = await _getFriendFeed();

    return ExploreData(todayRecipes, friendPosts);
  }

  // 获取样品探索食谱 json 显示在 ui
  Future<List<ExploreRecipe>> _getTodayRecipes() async {
    // 模拟阿皮请求等待时间
    await Future.delayed(const Duration(milliseconds: 1000));
    // 从文件系统加载 json
    final dataString =
        await _loadAsset('assets/sample_data/sample_explore_recipes.json');
    // 解码到 json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // 浏览每个食谱，并将 json 转换为探索研究对象
    if (json['recipes'] != null) {
      final recipes = <ExploreRecipe>[];
      json['recipes'].forEach((v) {
        recipes.add(ExploreRecipe.fromJson(v));
      });
      return recipes;
    } else {
      return [];
    }
  }

  // 让样本好友 json 帖子在 ui 中显示
  Future<List<Post>> _getFriendFeed() async {
    // 模拟阿皮请求等待时间
    await Future.delayed(const Duration(milliseconds: 1000));
    // 从文件系统加载 json
    final dataString =
        await _loadAsset('assets/sample_data/sample_friends_feed.json');
    // 解码到 json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // 浏览每个帖子，将 json 转换为"后"对象。
    if (json['feed'] != null) {
      final posts = <Post>[];
      json['feed'].forEach((v) {
        posts.add(Post.fromJson(v));
      });
      return posts;
    } else {
      return [];
    }
  }

  // 让样品食谱 json 在 ui 中显示
  Future<List<SimpleRecipe>> getRecipes() async {
    // 模拟阿皮请求等待时间
    await Future.delayed(const Duration(milliseconds: 1000));
    // 从文件系统加载 json
    final dataString =
        await _loadAsset('assets/sample_data/sample_recipes.json');
    // 解码到 json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // 浏览每个食谱，将 json 转换为简单删除对象。
    if (json['recipes'] != null) {
      final recipes = <SimpleRecipe>[];
      json['recipes'].forEach((v) {
        recipes.add(SimpleRecipe.fromJson(v));
      });
      return recipes;
    } else {
      return [];
    }
  }

  // 从文件系统加载样品 json 数据
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}

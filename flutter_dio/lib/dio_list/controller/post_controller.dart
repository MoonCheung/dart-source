import 'dart:io';
import 'dart:async';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/core/dio_method.dart';
// import 'package:flutter_dio/dio_util/dio_response.dart';
import 'package:flutter_dio/core/dio_util.dart';

import 'package:flutter_dio/dio_list/model/post_model.dart';

enum SortState { userID, id, title, body }

class PostController extends GetxController {
  final isLoading = true.obs;
  final postList = <PostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchApi();
  }

  CancelToken _cancelToken = CancelToken();

  // 获取数据方法
  void fetchApi() async {
    isLoading(true);
    await DioUtil()
        .request('/posts', method: DioMethod.get, cancelToken: _cancelToken)
        .then((data) {
      // NOTE: 不需要decode解码数据，直接返回给postModel.fromJson()
      final res = List<PostModel>.from(data.map((e) => PostModel.fromJson(e)));
      postList.assignAll(res);
      isLoading(false);
      update();
    }).catchError((_) {});
  }

  // 排序方法
  void sort(SortState sortState) async {
    switch (sortState) {
      case SortState.title:
        postList.sort((a, b) => a.title.compareTo(b.title));
        break;
      case SortState.id:
        postList.sort((a, b) => a.id.compareTo(b.id));
        break;
      case SortState.userID:
        postList.sort((a, b) => a.userId.compareTo(b.userId));
        break;
      case SortState.body:
        postList.sort((a, b) => a.body.compareTo(b.body));
        break;
    }
    update();
  }
}

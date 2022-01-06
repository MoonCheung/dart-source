import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

import '../model/post_model.dart';

class PostService {
  Future<List<PostModel>> fetchData() async {
    // 创建http url
    final url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    // 发送http请求
    final res = await http.get(url);
    if (res.statusCode == 200) {
      // 解码decode 响应内容所有数据遍历
      return List<PostModel>.from(json
          .decode(res.body)
          .map((item) => PostModel.fromJson(item))
          .toList());
    } else {
      developer.log("获取数据状态码：", error: res.statusCode);
      throw Exception();
    }
  }
}

import 'dart:convert'; // 用于在不同数据表示之间进行转换的编码器和解码器，包括 JSON 和 UTF-8。
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './model/post_model.dart';

class JsonAtricle extends StatefulWidget {
  const JsonAtricle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _JsonAtricleState createState() => _JsonAtricleState();
}

class _JsonAtricleState extends State<JsonAtricle> {
  PostModel? apidata;

  @override
  void initState() {
    super.initState();
    // 请求数据
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Text(
            apidata == null ? "" : '输出数据：${apidata.toString()}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ));
  }

  // 请求数据
  void fetchData() async {
    // 请求时间最多10秒
    const timeout = Duration(seconds: 10);
    // URI 可以传入 String authority, String unencodedPath, [Map<String, dynamic>? queryParameters
    final url = Uri.https('jsonplaceholder.typicode.com', '/posts/1');
    // 等待 http get 响应，然后解码 json 格式的响应。
    final res = await http.get(url).timeout(timeout);
    // 如果响应状态200的话，则解码json数据
    if (res.statusCode == 200) {
      // debugPrint('watch res:${res.body}');
      // debugPrint('watch 解码:${json.decode(res.body)}');
      setState(() {
        apidata = PostModel.fromJson(json.decode(res.body));
      });
    } else {
      throw Exception();
    }
  }
}

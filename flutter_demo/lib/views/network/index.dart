import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkState extends StatefulWidget {
  const NetworkState({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _NetworkStateState createState() => _NetworkStateState();
}

class _NetworkStateState extends State<NetworkState> {
  // 原生HttpClient 方法
  httpClientDemo() async {
    try {
      final httpClient = HttpClient();
      // 设置持续时间
      httpClient.idleTimeout = Duration(seconds: 5);
      // 解析URL
      final uri = Uri.parse("https://flutter.dev");
      final request = await httpClient.getUrl(uri);
      // 设置请求头
      request.headers.add("user-agent", "Custom-UA");
      final response = await request.close();

      print('Respone code: ${response.statusCode}');
      print(await response.transform(utf8.decoder).join());
    } catch (e) {
      print('Error:$e');
    }
  }

  // 使用http依赖库方法
  httpDemo() async {
    try {
      final client = http.Client();
      // 解析URL
      final uri = Uri.parse("https://flutter.dev");
      // 设置请求头
      http.Response response =
          await client.get(uri, headers: {"user-agent": "Custom-UA"});
      print('Respone code: ${response.statusCode}');
      print(response.body);
    } catch (e) {
      print('Error:$e');
    }
  }

  // 使用Dio方法
  dioDemo() async {
    try {
      Dio dio = Dio();
      // 解析URL,设置请求头
      final response = await dio.get("https://flutter.dev",
          options: Options(headers: {"user-agent": "Custom-UA"}));
      print(response.data.toString());
    } catch (e) {
      print('Error:$e');
    }
  }

  dioALLDemo() async {
    try {
      Dio dio = Dio();
      // 设置请求头
      dio.options.headers = {"user-agent": "Custom-UA"};
      final List<Response> response = await Future.wait([
        dio.get("https://flutter.dev"),
        dio.get("https://flutter.dev"),
      ]);

      print("第一获取响应数据: ${response[0].toString()}");
      print("第二获取响应数据: ${response[1].toString()}");
    } catch (e) {
      print('Error:$e');
    }
  }

  // 拦截器拒绝方法
  dioInterceptorReject() async {
    Dio dio = new Dio();
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      // 拒绝带有错误消息的请求/响应
      return handler
          .reject(DioError(requestOptions: options, error: "Error：拦截的原因"));
    }));

    try {
      final response = await dio.get("https://flutter.dev");
      print(response.data.toString());
    } catch (e) {
      print('Error:$e');
    }
  }

  // 拦截器缓存方法
  dioIntercepterCache() async {
    Dio dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      return handler.resolve(Response(requestOptions: options, data: '返回缓存数据'));
    }));

    try {
      final response = await dio.get("https://flutter.dev");
      print(response.data.toString());
    } catch (e) {
      print('Error:$e');
    }
  }

  //拦截器自定义请求头
  dioIntercepterCustomHeader() async {
    Dio dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      options.headers["user-agent"] = "Custom-UA";
      return handler.next(options);
    }));

    try {
      final response = await dio.get("https://flutter.dev");
      print(response.data.toString());
    } catch (e) {
      print('Error:$e');
    }
  }

  // mock json
  String jsonString = '''
    {
      "id":"123",
      "name":"张三",
      "score" : 95,
      "teacher": 
         {
           "name": "李四",
           "age" : 40
         }
    }
    ''';

  static Student parseStudent(String content) {
    return Student.fromJson(json.decode(content));
  }

  Future<Student> loadStudent() {
    return compute(parseStudent, jsonString);
  }

  jsonParseDemo() {
    loadStudent().then((s) {
      String content = '''
        name: ${s.name}
        score:${s.score}
        teacher:${s.teacher.name}
        ''';
      print(content);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Text('HttpClient demo'),
                  onPressed: () => httpClientDemo(),
                ),
                ElevatedButton(
                  child: Text('http Demo'),
                  onPressed: () => httpDemo(),
                ),
                ElevatedButton(
                  child: Text('dio demo'),
                  onPressed: () => dioDemo(),
                ),
                ElevatedButton(
                  child: Text('dioALL demo'),
                  onPressed: () => dioALLDemo(),
                ),
                ElevatedButton(
                  child: Text('Dio 拦截'),
                  onPressed: () => dioInterceptorReject(),
                ),
                ElevatedButton(
                  child: Text('Dio 缓存'),
                  onPressed: () => dioIntercepterCache(),
                ),
                ElevatedButton(
                  child: Text('Dio 自定义请求头'),
                  onPressed: () => dioIntercepterCustomHeader(),
                ),
                ElevatedButton(
                  child: Text('JSON解析 Demo'),
                  onPressed: () => jsonParseDemo(),
                ),
              ]),
        )));
  }
}

class Student {
  Student(
      {required this.id,
      required this.name,
      required this.score,
      required this.teacher});
  String id;
  String name;
  int score;
  Teacher teacher;

  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
      id: parsedJson['id'],
      name: parsedJson['name'],
      score: parsedJson['score'],
      teacher: Teacher.fromJson(parsedJson['teacher']),
    );
  }
}

class Teacher {
  Teacher({required this.name, required this.age});
  String name;
  int age;

  factory Teacher.fromJson(Map<String, dynamic> parsedJson) {
    return Teacher(name: parsedJson['name'], age: parsedJson['age']);
  }
}

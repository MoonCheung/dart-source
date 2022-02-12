import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dio_list/dio_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Dio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(
            name: '/dio_list', page: () => DioList(title: 'Dio List Sample')),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> entries = <String>['Flutter Dio List'];
  final List<int> colorCodes = <int>[100];
  final List<String> pathList = <String>['/dio_list'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter dio'),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  Get.toNamed(pathList[index]);
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.amber[colorCodes[index]],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  child: Center(child: Text('点击 ${entries[index]}')),
                ));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(color: Colors.transparent),
        ));
  }
}

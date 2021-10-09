import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';

// 应用程序启动时代码的入口点
void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  // 此小部件是应用的根源。
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        )
      ),
      home: const MyHomePage(title: 'Recipe Calculator')
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context){
    // 返回脚手架
    return Scaffold(
      appBar: AppBar(
        // 传入小部件来获取标题属性
        title: Text(widget.title),
      ),
      body: SafeArea(
        // 子节点容器
        // 它是一个空的Container小部件
        child: ListView.builder(
          //List samples的长度
          itemCount: Recipe.samples.length,
          //List samples的标签
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              // 点击小部件时回调触发
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return RecipeDetail(recipe: Recipe.samples[index]);
                  })
                )
              },
              child: buildRecipesCard(Recipe.samples[index])
            );
          }
        ),
      )
    );
  }

  // Widget 自定义方法
  Widget buildRecipesCard(Recipe recipe){
    return Card(
      // 设置卡片阴影
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        // 内边距 properties
        padding: const EdgeInsets.all(16.0),
        // child properties：Column, Column是定义垂直布局的小部件
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(recipe.imageUrl)),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      )
    );
  }
}

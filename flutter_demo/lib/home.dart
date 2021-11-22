import 'package:flutter/material.dart';
import './count.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with WidgetsBindingObserver {
  //当Widget第一次插入到Widget树时会被调用。对于每一个State对象，Flutter只会调用该回调一次
  @override
  void initState() {
    super.initState();
    print("Home initState......");
    WidgetsBinding.instance.addObserver(this); //注册监听器

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("单次Frame绘制回调"); //只回调一次
    });

    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      print("实时Frame绘制回调"); //每帧都回调
    });
  }

  // 设置状态
  @override
  void setState(fn) {
    super.setState(fn);
    print('设置状态:$fn');
  }

  /*
  *初始化时，在initState之后立刻调用
  *当State的依赖关系发生变化时，会触发此接口被调用
  */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Home didChangeDependencies....');
  }

  //绘制界面
  @override
  Widget build(BuildContext context) {
    print("home首页 build......");
    return Scaffold(
        appBar: AppBar(title: Text('Home page')),
        body: Center(
            child: Column(children: <Widget>[
          ElevatedButton(
            child: Text("打开/关闭新页面查看状态变化"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Count()),
            ),
          )
        ])));
  }

  //状态改变的时候会调用该方法,比如父类调用了setState
  @override
  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Home didUpdateWidget......");
  }

  //当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    print('Home deactivate...');
  }

  //当State对象从树中被永久移除时调用；通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
    print('Home dispose...');
  }

  //监听App生命周期回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print("监听App生命周期回调:$state");
  }
}

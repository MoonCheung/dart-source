// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class GestureView extends StatelessWidget {
  const GestureView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: const Scaffold(
            body: TabBarView(
              // 禁止用户手动滚动
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListenerWidget(),
                DragWidget(),
                DoubleGestureWidget(),
              ],
            ),
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "指针事件",
                ),
                Tab(
                  icon: Icon(Icons.gesture),
                  text: "手势",
                ),
                Tab(
                  icon: Icon(Icons.perm_identity),
                  text: "手势冲突",
                )
              ],
              // 未选择的选项卡标签的颜色
              unselectedLabelColor: Colors.blueGrey,
              // 选项卡标签颜色
              labelColor: Colors.blue,
              // 选项卡标签指示器大小
              indicatorSize: TabBarIndicatorSize.label,
              // 选项卡标签指示器颜色
              indicatorColor: Colors.red,
            ),
          )),
    );
  }
}

// 侦听小部件
class ListenerWidget extends StatefulWidget {
  const ListenerWidget({Key? key}) : super(key: key);

  @override
  State<ListenerWidget> createState() => _ListenerWidgetState();
}

class _ListenerWidgetState extends State<ListenerWidget> {
  int _downCounter = 0;
  int _upCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void handlePointerDown(PointerEvent event) {
    handlePointerMove(event);
    setState(() {
      _downCounter++;
    });
  }

  void handlePointerUp(PointerEvent event) {
    handlePointerMove(event);
    setState(() {
      _upCounter++;
    });
  }

  void handlePointerMove(PointerEvent event) {
    setState(() {
      x = event.position.dx;
      y = event.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints.tight(const Size(300.0, 200.0)),
        child: Listener(
          child: Container(
            color: Colors.lightBlueAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('您已经在此区域按下或释放了这么多次:'),
                Text(
                  '$_downCounter presses\n$_upCounter releases',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  '光标在这里: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',
                ),
              ],
            ),
          ),
          onPointerDown: handlePointerDown,
          onPointerMove: handlePointerMove,
          onPointerUp: handlePointerUp,
        ));
  }
}

// 拖动小部件
class DragWidget extends StatefulWidget {
  const DragWidget({Key? key}) : super(key: key);

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
      Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: Container(color: Colors.blue, width: 100, height: 100),
            // 点击按钮调用
            onTap: () => print('onTap...'),
            // 连续轻击屏幕两次调用
            onDoubleTap: () => print('onDoubleTap...'),
            // 当识别出带有主按钮的长按手势时调用。
            onLongPress: () => print('onLongPress...'),
            // 通过主按钮与屏幕接触并移动的指针事件调用
            onPanUpdate: (event) {
              print('接触并移动:${event}');
              setState(() {
                _left += event.delta.dx;
                _top += event.delta.dy;
              });
            },
          ))
    ]));
  }
}

// 双手拖动小部件
class DoubleGestureWidget extends StatefulWidget {
  const DoubleGestureWidget({Key? key}) : super(key: key);

  @override
  State<DoubleGestureWidget> createState() => _DoubleGestureWidgetState();
}

class _DoubleGestureWidgetState extends State<DoubleGestureWidget> {
  String _last = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        //自己构造父Widget的手势识别映射关系
        child: RawGestureDetector(
      gestures: {
        //建立多手势识别器与手势识别工厂类的映射关系，从而返回可以响应该手势的recognizer
        MultipleTapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<MultipleTapGestureRecognizer>(
          () => MultipleTapGestureRecognizer(),
          (MultipleTapGestureRecognizer instance) {
            instance
              ..onTapDown = (TapDownDetails details) {
                setState(() {
                  _last = 'down';
                });
              }
              ..onTapUp = (TapUpDetails details) {
                setState(() {
                  _last = 'up';
                });
              }
              ..onTap = () {
                setState(() {
                  _last = 'tap';
                });
              }
              ..onTapCancel = () {
                setState(() {
                  _last = 'cancel';
                });
              };
          },
        )
      },
      child: Container(
        color: Colors.pinkAccent,
        child: Center(
          //子视图可以继续使用GestureDetector
          child: GestureDetector(
              onTap: () => print('Child tapped'),
              child: Container(
                color: Colors.blueAccent,
                width: 200.0,
                height: 200.0,
                child: Center(
                  child: Text(_last),
                ),
              )),
        ),
      ),
    ));
  }
}

// 自定义手势识别器
class MultipleTapGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

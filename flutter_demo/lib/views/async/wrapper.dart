import 'package:flutter/material.dart';

// 用于在 stateless 小部件中提供 function 调用的有状态功能的包装器
class WrapperWidget extends StatefulWidget {
  const WrapperWidget({Key? key, required this.onFun, required this.child})
      : super(key: key);
  final Function onFun;
  final Widget child;

  @override
  _WrapperWidgetState createState() => _WrapperWidgetState();
}

class _WrapperWidgetState extends State<WrapperWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.onFun != null) return widget.onFun();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

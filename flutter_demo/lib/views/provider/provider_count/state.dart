import 'package:flutter/material.dart';
import 'package:flutter_demo/views/provider/provider_count/logic.dart';

class ProviderCounterWidget extends StatefulWidget {
  const ProviderCounterWidget({Key? key, this.controller}) : super(key: key);

  final ChangeNotifierController? controller;

  @override
  State<ProviderCounterWidget> createState() => _ProviderCounterWidgetState();
}

class _ProviderCounterWidgetState extends State<ProviderCounterWidget> {
  @override
  void initState() {
    super.initState();

    // 添加回调 value改变时,自动触发回调内容
    widget.controller?.addListener(_change);
  }

  // 被触发的回调
  void _change() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.controller?.value ?? '初始值为空',
        style: const TextStyle(fontSize: 30.0),
      ),
    );
  }
}

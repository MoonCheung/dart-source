import 'package:flutter/material.dart';

class CustomNotification extends Notification {
  const CustomNotification(this.msg);
  final String msg;
}

class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => CustomNotification('Hi 内容分发～～').dispatch(context),
      child: Text("Fire Notification"),
    );
  }
}

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationWidget> {
  late String _msg = '通知:';

  @override
  Widget build(BuildContext context) {
    //监听通知
    return NotificationListener<CustomNotification>(
        onNotification: (data) {
          setState(() {
            _msg += data.msg + '\n';
          });
          // 返回 true 以取消通知冒泡
          return true;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(_msg), CustomChild()],
        ));
  }
}

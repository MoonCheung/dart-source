import 'dart:async';

// 设置milliseconds属性：200毫秒
const Duration delay = Duration(milliseconds: 200);

Future runServer() async {
  await for (String msg in requests()) {
    print('received request: $msg');
    if (msg == 'bar') throw ('unrecognized request: $msg');
  }
}

Stream<String> requests() async* {
  await new Future.delayed(delay);
  yield 'foo';

  await new Future.delayed(delay);
  yield 'bar';
}

void main() {
  // 所有 Dart 程序都隐式运行在根区域中。
  // runZoned 创建一个新区域。新区域是根区域的子区域。
  runZoned(() async {
    await runServer();
  },
      // Any uncaught errors in the child zone are sent to the [onError] handler.
      onError: (e, stacktrace) {
    print('捕获错误: $e');
  },
      // 区域指定允许覆盖功能, like print()
      zoneSpecification: ZoneSpecification(
          print: (Zone self, ZoneDelegate parent, Zone zone, String message) {
    parent.print(zone, '${new DateTime.now()}: $message');
  }));
}

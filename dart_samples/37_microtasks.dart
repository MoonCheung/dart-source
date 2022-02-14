import 'dart:async';

main() {
  // Future() 在活动队列上安排任务：
  new Future(() => print('world')); // 4
  print('hello'); // 1

  // scheduleMicrotask() 将任务添加到微任务队列
  // 微任务队列上的任务在下一个队列之前执行
  // 事件队列上的运行循环
  scheduleMicrotask(() => print('beautiful')); // 3

  print('there'); // 2
}

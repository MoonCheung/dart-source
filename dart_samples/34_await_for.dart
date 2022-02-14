import 'dart:async';

// 设置milliseconds属性：200毫秒
const Duration delay = const Duration(milliseconds: 200);

Stream numbersDownFrom(int n) async* {
  while (n >= 0) {
    await new Future.delayed(delay);
    yield n--;
  }
}

void main() async {
  await for (int i in numbersDownFrom(7)) {
    print('$i bottles of beer');
  }
}

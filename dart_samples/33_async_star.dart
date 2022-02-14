import 'dart:async';

// 设置milliseconds属性：200毫秒
const Duration delay = const Duration(milliseconds: 200);

Stream printNumbersDownAsync(int n) async* {
  int k = n;
  while (k >= 0) {
    yield await loadMessageForNumber(k--);
  }
}

Future loadMessageForNumber(int i) async {
  await Future.delayed(delay);
  if (i % 2 == 0) {
    return '偶数';
  }
  return '奇数';
}

void main() async {
  await for (String msg in printNumbersDownAsync(7)) {
    print(msg);
  }
}

import 'dart:async';

// 设置milliseconds属性：200毫秒
const Duration delay = const Duration(milliseconds: 200);

// 此函数不使用异步/等待；只是
// 标准的 Future API
Future<String> loadLastName(String name) {
  return Future.delayed(delay).then((_) {
    return 'cheung ' + name;
  });
}

// 或者async...await函数返回Future
Future<String> loadFirstName(String name) async {
  await Future.delayed(delay);
  return name + ' moon!!!';
}
void main() async{
  // 'await' 将暂停函数的执行，直到
  // future 完成:
  var gregsLastName = await loadLastName('moon');
  var stevesLastName = await loadFirstName('cheung');
  print('Future标准函数: ${gregsLastName}');
  print('async...await: ${stevesLastName}');
}
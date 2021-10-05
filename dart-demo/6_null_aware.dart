void main(){
  var today = 'docker'; // 声明一个变量对应值
  var yesterday; // 空值
  // 这 ?? 运算符返回第一个表达式 IFF 它不为空
  var next = yesterday ?? today;
  print('下一次约会: $next');
  // ??= 运算符分配一个值 IFF 它不为空
  var wednesday;
  next ??= wednesday;
  print('下次约会 : $next');

  //  ? 运算符调用函数 IFF 对象不为空
  String? thursday;
  // 使用空感知操作符之前必须设置var变量为空，但是默认不为空. String? thursday 
  var length = thursday?.length;
  print('length: $length');
}
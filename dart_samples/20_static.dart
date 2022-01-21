class Position {
  // 静态方法，只能在类本身的方法访问，不可对实例化的类进行操作
  static int get maxX => 100;  
  // 静态变量
  static int maxY = 200;
}

void main(){
  print('静态方法:${Position.maxX}');
  print('静态属性:${Position.maxY}');
}
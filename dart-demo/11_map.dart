void main(){
  // 省略new
  // 添加keys
  var colors = Map();
  colors['blue'] = true;
  colors['red'] = false;
  print('colors: ${colors}');

  // 也可以使用大括号文字
  var shapes = {
    'square': false,
    'triangle': true
  };
  print('shapes: ${shapes}');

  // 键和值可以迭代。 
  // HashMap 以任意顺序迭代，而 LinkedHashMap 和 SplayTreeMap 
  // 按照它们插入Map的顺序进行迭代。
  for(var key in shapes.keys) print('遍历key:${key}');
  for(var value in shapes.values) print('遍历value:${value}');
}
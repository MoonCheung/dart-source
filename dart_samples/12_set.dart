void main(){
  // 省略new
  var medals = Set();
  medals.add("gold");
  medals.add("silver");
  medals.add("bronze");

  // HashSets 使用相等运算符 (==) 来确定 
  // 如果它已经包含一个项目
  medals.add("gold");

  print('has gold? ${medals.contains("gold")}');
  print('has platinum? ${medals.contains("platinum")}');
  print("输出set: ${medals}");

  // 可以从 Iterables 构造集合
  var meals = Set.from(['breakfast', 'lunch', 'dinner']);

  //一些内置功能：
  print(medals.union(meals));
  print(medals.lookup("gold"));
  print(medals.lookup("platinum"));
  print(medals.difference(meals));
}
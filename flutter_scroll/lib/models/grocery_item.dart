import 'package:flutter/painting.dart';

// 一个枚举
enum Importance { low, medium, high }

class GroceryItem {
  final String id;
  final String name;
  final Importance importance;
  final Color color;
  final int quantity;
  final DateTime date;
  final bool isComplete;

  // 实例化class里面部分必传参数, 默认参数
  GroceryItem(
      {required this.id,
      required this.name,
      required this.importance,
      required this.color,
      required this.quantity,
      required this.date,
      this.isComplete = false});

  // 创建当前 GroceryItem 的克隆，但提供的参数被覆盖。
  GroceryItem copyWith({
    String? id,
    String? name,
    Importance? importance,
    Color? color,
    int? quantity,
    DateTime? date,
    bool? isComplete,
  }) {
    return GroceryItem(
        id: id ?? this.id,
        name: name ?? this.name,
        importance: importance ?? this.importance,
        color: color ?? this.color,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
        isComplete: isComplete ?? this.isComplete);
  }
}

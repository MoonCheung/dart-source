import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Google 字体 依赖包
import 'package:intl/intl.dart';

import '../models/grocery_item.dart';

class GroceryTile extends StatelessWidget {
  // 声明来自 grocery_item 模型类型
  final GroceryItem item;
  // 声明回调函数，可让您知道用户是否打开或关闭了复选框
  final Function(bool?)? onComplete;
  // 声明文本装饰物
  final TextDecoration textDecoration;

  GroceryTile({Key? key, required this.item, this.onComplete})
      : this.textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO 21: Change this Widget
    // NOTE: 这里不需要 Container 容器，由SizedBox小部件来代替
    return SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // TODO 22: Add Row to group (name, date, importance)
            Row(children: <Widget>[
              Container(width: 5.0, color: item.color),
              const SizedBox(width: 16.0),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // 显示名称
                    Text(
                      item.name,
                      style: GoogleFonts.lato(
                          decoration: textDecoration,
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    // 返回时间显示
                    buildDate(),
                    const SizedBox(height: 4.0),
                    // 返回标签显示
                    buildImportance(),
                  ])
            ]),
            // TODO 23: Add Row to group (quantity, checkbox)
            Row(children: <Widget>[
              Text(
                // 显示项目的数量
                item.quantity.toString(),
                style: GoogleFonts.lato(
                    decoration: textDecoration, fontSize: 21.0),
              ),
              // 8
              buildCheckbox(),
            ])
          ],
        ));
  }

  // 显示重要性的标签
  Widget buildImportance() {
    if (item.importance == Importance.low) {
      return Text('Low', style: GoogleFonts.lato(decoration: textDecoration));
    } else if (item.importance == Importance.medium) {
      return Text('medium',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w800, decoration: textDecoration));
    } else if (item.importance == Importance.high) {
      return Text('high',
          style: GoogleFonts.lato(
              color: Colors.red,
              fontWeight: FontWeight.w900,
              decoration: textDecoration));
    } else {
      throw Exception('这种重要性类型并不存在');
    }
  }

  // 显示所选时间
  Widget buildDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm: a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  // 显示复选框
  Widget buildCheckbox() {
    return Checkbox(value: item.isComplete, onChanged: onComplete);
  }
}

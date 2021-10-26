import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart'; //为您的应用提供材质颜色选择器
import 'package:intl/intl.dart'; // 提供国际化和本地化实用程序。您将使用它来格式化日期
import 'package:uuid/uuid.dart'; // 为每个杂货项目生成唯一的密钥。这有助于您了解要添加、更新或删除的项目
import '../components/grocery_tile.dart';
import '../models/models.dart';

class GroceryItemScreen extends StatefulWidget {
  // 一个回调函数，创建项目
  final Function(GroceryItem) onCreate;
  // 一个回调函数，返回更新杂货项目
  final Function(GroceryItem) onUpdate;
  // 3
  final GroceryItem? originalItem;
  // 确定用户是在创建还是编辑项目
  final bool isUpdating;

  const GroceryItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  @override
  _GroceryItemScreenState createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  // TODO: Add grocery item screen state properties
  // 为可编辑文本字段创建控制器
  final TextEditingController _nameController = TextEditingController();
  // 声明字符串类型 存储项目的名称
  String _name = '';
  // 私有字段 存储重要性级别
  Importance _importance = Importance.low;
  // 存储当前日期和时间
  DateTime _dueDate = DateTime.now();
  // 存储当前时间
  TimeOfDay _timeOfDay = TimeOfDay.now();
  // 存储颜色标签
  Color _currentColor = Colors.green;
  // 存储物品的数量
  int _currentSliderValue = 0;

  // TODO: Add initState()
  @override
  void initState() {
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });

    super.initState();
  }

  // TODO: Add dispose()
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold 小部件定义整个屏幕的主要布局和结构
    return Scaffold(
      appBar: AppBar(
          actions: [
            // 添加打勾图标
            IconButton(
                onPressed: () {
                  // TODO 24: Add callback handler
                  print('点击打勾触发:${widget}');
                  final groceryItem = GroceryItem(
                      id: widget.originalItem?.id ?? const Uuid().v1(),
                      name: _nameController.text,
                      importance: _importance,
                      color: _currentColor,
                      quantity: _currentSliderValue,
                      date: DateTime(
                        _dueDate.year,
                        _dueDate.month,
                        _dueDate.day,
                        _timeOfDay.hour,
                        _timeOfDay.minute,
                      ));

                  // 使用widget 这个类本身的属性
                  if (widget.isUpdating) {
                    // 如果用户正在更新现有项目。
                    widget.onUpdate(groceryItem);
                  } else {
                    // 如果用户正在创建新项目
                    widget.onCreate(groceryItem);
                  }
                },
                icon: const Icon(Icons.check)),
          ],
          //放置此应用栏相对于其父级的 z 坐标
          elevation: 3,
          title: Text(
            'Grocery Item',
            style: GoogleFonts.lato(fontWeight: FontWeight.w600),
          )),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: [
            buildNameField(context),
            buildImportanceField(context),
            buildDateField(context),
            buildTimeField(context),
            buildColorPicker(context),
            // TODO 18: Add slider
            const SizedBox(height: 10.0),
            buildQuantityField(context),
            // TODO: 19: Add Grocery Tile
            GroceryTile(
                item: GroceryItem(
                    id: 'previewMode',
                    name: _name,
                    importance: _importance,
                    color: _currentColor,
                    quantity: _currentSliderValue,
                    // 年月日份、小时分钟
                    date: DateTime(
                      _dueDate.year,
                      _dueDate.month,
                      _dueDate.day,
                      _timeOfDay.hour,
                      _timeOfDay.minute,
                    )))
          ])),
    );
  }

  // 自定义输入框小部件
  Widget buildNameField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Item name',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
            controller: _nameController,
            cursorColor: _currentColor,
            decoration: InputDecoration(
                hintText: 'E.g. Apples, Banana, 1 Bag of salt',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _currentColor)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: _currentColor)))),
      ],
    );
  }

  // 自定义选择器小部件
  Widget buildImportanceField(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Importance',
            style: GoogleFonts.lato(fontSize: 28.0),
          ),
          Wrap(spacing: 10.0, children: <Widget>[
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.low,
              label: const Text(
                'low btn',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                print('watch selected low:${selected}');
                setState(() {
                  _importance = Importance.low;
                });
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.medium,
              label: const Text(
                'medium btn',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                print('watch selected medium:${selected}');
                setState(() {
                  _importance = Importance.medium;
                });
              },
            ),
            ChoiceChip(
              selectedColor: Colors.black,
              selected: _importance == Importance.high,
              label: const Text(
                'high btn',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                print('watch selected high:${selected}');
                setState(() {
                  _importance = Importance.high;
                });
              },
            )
          ])
        ]);
  }

  // 自定义时间小部件
  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Date',
                style: GoogleFonts.lato(fontSize: 28.0),
              ),
              TextButton(
                child: const Text('选择'),
                // 事件方法成异步事件方法
                onPressed: () async {
                  // 当前日期
                  final currentDate = DateTime.now();
                  final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: currentDate,
                      lastDate: DateTime(currentDate.year + 5));
                  setState(() {
                    if (selectedDate != null) {
                      _dueDate = selectedDate;
                    }
                  });
                },
              )
            ]),
        // 格式化当前日期并用Text 小部件.
        Text('${DateFormat('yyyy-MM-dd').format(_dueDate)}')
      ],
    );
  }

  // 自定义时间小部件
  Widget buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Time of Day',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
                child: const Text('选择'),
                onPressed: () async {
                  final selectedTime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  // 改变其状态
                  setState(() {
                    if (selectedTime != null) {
                      _timeOfDay = selectedTime;
                    }
                  });
                })
          ],
        ),
        Text('${_timeOfDay.format(context)}')
      ],
    );
  }

  // 自定义颜色小部件
  Widget buildColorPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 50.0,
              width: 10.0,
              color: _currentColor,
            ),
            const SizedBox(width: 8.0),
            Text(
              'Color',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
          ],
        ),
        TextButton(
          child: const Text('选择'),
          onPressed: () {
            // Material UI自带小部件
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: BlockPicker(
                        pickerColor: Colors.white,
                        onColorChanged: (color) {
                          setState(() => _currentColor = color);
                        },
                      ),
                      actions: [
                        TextButton(
                            child: const Text('保存'),
                            onPressed: () {
                              // 保存后退出该对话框
                              Navigator.of(context).pop();
                            })
                      ]);
                });
          },
        )
      ],
    );
  }

  // 自定义数量小部件
  Widget buildQuantityField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Quantity', style: GoogleFonts.lato(fontSize: 28.0)),
        const SizedBox(width: 16.0),
        Text(
          // 转化整型再次转化字符串
          _currentSliderValue.toInt().toString(),
          style: GoogleFonts.lato(fontSize: 18.0),
        ),
        Slider(
          // 非活动颜色
          inactiveColor: _currentColor.withOpacity(0.5),
          // 活动颜色
          activeColor: _currentColor,
          // 转化浮点型
          value: _currentSliderValue.toDouble(),
          // 最小值
          min: 0.0,
          // 最大值
          max: 100.0,
          // 通常与label一起使用，以显示当前的离散值
          divisions: 100,
          // 标签名，转化整型再次转化字符串
          label: _currentSliderValue.toInt().toString(),
          // 改变事件方法
          onChanged: (double value) {
            setState(() => _currentSliderValue = value.toInt());
          },
        )
      ],
    );
  }
}

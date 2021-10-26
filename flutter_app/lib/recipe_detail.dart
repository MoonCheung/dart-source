import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;

  // 重载
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.recipe.label),
        ),
        // SafeArea 防止应用程序过于靠近操作系统界面，例如大多数 iPhone 的凹槽或交互区域。
        body: SafeArea(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity, // 浮点数无穷大
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.all(7.0),
              itemCount: widget.recipe.ingredient.length,
              itemBuilder: (BuildContext context, int index) {
                final ingredient = widget.recipe.ingredient[index];
                return Text(
                    '${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}');
              },
            )),
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              label: '${_sliderVal * widget.recipe.servings} servings',
              value: _sliderVal.toDouble(),
              onChanged: (value) {
                setState(() {
                  _sliderVal = value.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            )
          ],
        )));
  }
}

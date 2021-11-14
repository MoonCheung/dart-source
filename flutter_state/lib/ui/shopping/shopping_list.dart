import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/memory_repository.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final checkBoxValues = Map<int, bool>();
  // TODO: Remove ingredients declaration
  // static const ingredients = <String>[];

  @override
  Widget build(BuildContext context) {
    // TODO: Add Consumer widget
    return Consumer<MemoryRepository>(builder: (context, repository, child) {
      final ingredients = repository.findAllIngredients();
      return ListView.builder(
          itemCount: ingredients.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
              value:
                  checkBoxValues.containsKey(index) && checkBoxValues[index]!,
              // TODO: Update title to include name
              title: Text(ingredients[index].name ?? ''),
              onChanged: (newValue) {
                if (newValue != null) {
                  setState(() {
                    checkBoxValues[index] = newValue;
                  });
                }
              },
            );
          });
      // TODO: Add closing brace and parenthesis
    });
  }
}

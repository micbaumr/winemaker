import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:winemaker/view/constants.dart';
import 'package:winemaker/view/task/adding_ingredients/added_ingredients_form.dart';
import 'package:winemaker/view/task/adding_ingredients/required_ingredients_display.dart';

class IngredientsScreen extends StatelessWidget {
  const IngredientsScreen({Key? key, required this.currentTaskIndex}) : super(key: key);

  final int currentTaskIndex;

  @override
  Widget build(BuildContext context) {
    final List<Widget> ingredientsView = [
      const Text("Ingredients added:", textAlign: TextAlign.center, style: biggerFont),
      const RequiredIngredientsDisplay(),
      const Divider(),
      const Text("Remaining ingredients to add", textAlign: TextAlign.center, style: biggerFont),
      IngredientsForm(currentTaskIndex: currentTaskIndex),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adding ingredients'),
      ),
      body: ListView(children: ingredientsView),
    );
  }
}

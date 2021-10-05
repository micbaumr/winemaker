import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:winemaker/view/constants.dart';
import 'package:winemaker/view/task/adding_ingredients/added_ingredients_form.dart';
import 'package:winemaker/view/task/adding_ingredients/required_ingredients_display.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({Key? key}) : super(key: key);

  @override
  _IngredientsScreenState createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> ingredientsView = [
      const Text("Ingredients added:",
          textAlign: TextAlign.center, style: biggerFont),
      const RequiredIngredientsDisplay(),
      const Divider(),
      const Text("Remaining ingredients to add",
          textAlign: TextAlign.center, style: biggerFont),
      const IngredientsForm(),
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Adding ingredients'),
        ),
        body: Column(children: [
          Expanded(child: ListView(children: ingredientsView)),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Start Winemaker"),
          ),
        ]));
  }
}

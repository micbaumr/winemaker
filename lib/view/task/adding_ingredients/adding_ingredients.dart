// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:winemaker/view/constants.dart';
// import 'package:winemaker/view/utils/text_future_builder.dart';
//
// class AddingIngredients extends StatefulWidget {
//   const AddingIngredients({Key? key}) : super(key: key);
//
//   @override
//   _AddingIngredientsState createState() => _AddingIngredientsState();
// }
//
// class _AddingIngredientsState extends State<AddingIngredients> {
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> mustParameters = [
//       const Text("Must parameters", textAlign: TextAlign.center, style: biggerFont),
//       getTextFutureBuilder(_volume, "Volume", "l"),
//       getTextFutureBuilder(_sugar, "Sugar", "Blg"),
//       const Divider(),
//       const Text("Desired wine parameters", textAlign: TextAlign.center,
//           style: biggerFont),
//       getTextFutureBuilder(_desiredAlcohol, "Alcohol", "%"),
//       getTextFutureBuilder(_desiredSugar, "Sugar", "Blg"),
//     ];
//
//     return Scaffold(
//         appBar: AppBar(
//         title: const Text('Must parameters'),
//     ),
//     body: Column(children: [
//     Expanded(child: ListView(children: mustParameters)),
//     ElevatedButton(
//     onPressed: () {},
//     child: const Text("Start Winemaker"),
//     )
//     ,
//     ]
//     )
//   }
// }

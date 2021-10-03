// import 'package:flutter/material.dart';
// import 'package:winemaker/src/desired_wine/desired_wine.dart';
// import 'package:winemaker/src/desired_wine/desired_wine_service.dart';
// import 'package:winemaker/src/user_input_utils.dart';
// import 'package:winemaker/view/task/must_parameters_display.dart';
// import 'package:winemaker/view/utils/form_builder.dart';
//
// class IngredientsForm extends StatefulWidget {
//   const IngredientsForm({Key? key}) : super(key: key);
//
//   @override
//   _IngredientsFormState createState() => _IngredientsFormState();
// }
//
// class _IngredientsFormState extends State<IngredientsForm> {
//   final _formKey = GlobalKey<FormState>();
//   final desiredAlcoholController = TextEditingController();
//   final desiredSweetnessController = TextEditingController();
//
//   @override
//   void dispose() {
//     desiredAlcoholController.dispose();
//     desiredSweetnessController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Provide necessary data'),
//         ),
//         body: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               getNumberFormField(
//                   desiredAlcoholController, "Desired alcohol level in %",
//                   autofocus: true),
//               getNumberFormField(
//                   desiredSweetnessController, "Desired sweetness in Blg"),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _saveDesiredWine(context);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => MustParametersDisplay()),
//                       );
//                     }
//                   },
//                   child: const Text('Submit'),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
//
//   void _saveDesiredWine(BuildContext context) {
//     var alcohol = parseDoubleInput(desiredAlcoholController.text);
//     var sugar = parseDoubleInput(desiredSweetnessController.text);
//     saveDesiredWineParameters(context, DesiredWine(alcohol, sugar));
//   }
// }

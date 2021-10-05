import 'package:flutter/material.dart';
import 'package:winemaker/src/ingredients/ingredients.dart';
import 'package:winemaker/src/ingredients/ingredients_service.dart';
import 'package:winemaker/src/user_input_utils.dart';
import 'package:winemaker/view/task/must_parameters_display.dart';
import 'package:winemaker/view/utils/form_builder.dart';

class IngredientsForm extends StatefulWidget {
  const IngredientsForm({Key? key}) : super(key: key);

  @override
  _IngredientsFormState createState() => _IngredientsFormState();
}

class _IngredientsFormState extends State<IngredientsForm> {
  final _formKey = GlobalKey<FormState>();
  final sugarController = TextEditingController();
  final waterController = TextEditingController();
  bool wasYeastAdded = false;
  bool wereNutrientsAdded = false;
  late IngredientsService ingredientsService;

  @override
  void dispose() {
    sugarController.dispose();
    waterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ingredientsService = IngredientsService(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getNumberFormField(sugarController, "Added sugar in kg",
              autofocus: true),
          getNumberFormField(waterController, "Added water in litres"),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: wasYeastAdded,
                onChanged: (bool? value) {
                  setState(() {
                    wasYeastAdded = value!;
                  });
                },
              ),
              const Text("Yeast added"),
            ],
          ),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: wereNutrientsAdded,
                onChanged: (bool? value) {
                  setState(() {
                    wereNutrientsAdded = value!;
                  });
                },
              ),
              const Text("Nutrients added"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _saveIngredients(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MustParametersDisplay()),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }

  void _saveIngredients(BuildContext context) {
    var sugar = parseDoubleInput(sugarController.text);
    var water = parseDoubleInput(waterController.text);
    ingredientsService.saveAddedIngredients(
        1, Ingredients(sugar, water, wasYeastAdded, wereNutrientsAdded));
  }
}

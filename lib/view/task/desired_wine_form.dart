import 'package:flutter/material.dart';
import 'package:winemaker/src/desired_wine/desired_wine.dart';
import 'package:winemaker/src/desired_wine/desired_wine_service.dart';
import 'package:winemaker/src/user_input_utils.dart';
import 'package:winemaker/view/utils/form_builder.dart';

class DesiredWineForm extends StatefulWidget {
  const DesiredWineForm({Key? key}) : super(key: key);

  @override
  _DesiredWineFormState createState() => _DesiredWineFormState();
}

class _DesiredWineFormState extends State<DesiredWineForm> {
  final _formKey = GlobalKey<FormState>();
  final desiredAlcoholController = TextEditingController();
  final desiredSweetnessController = TextEditingController();
  late DesiredWineService desiredWineService;

  @override
  void dispose() {
    desiredAlcoholController.dispose();
    desiredSweetnessController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    desiredWineService = DesiredWineService(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Provide necessary data'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getNumberFormField(desiredAlcoholController, "Desired alcohol level in %", autofocus: true),
              getNumberFormField(desiredSweetnessController, "Desired sweetness in Blg"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveDesiredWine();
                      Navigator.pop(context, true);
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }

  void _saveDesiredWine() {
    var alcohol = parseDoubleInput(desiredAlcoholController.text);
    var sugar = parseDoubleInput(desiredSweetnessController.text);
    desiredWineService.saveDesiredWineParameters(DesiredWine(alcohol, sugar));
  }
}

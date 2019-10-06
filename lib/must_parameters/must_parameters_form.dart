import 'package:flutter/material.dart';
import 'package:winemaker/desiredWine.dart';

import 'must.dart';
import 'mustConfirmation.dart';

class MustParametersForm extends StatefulWidget {
  @override
  MustParametersFormState createState() => MustParametersFormState();
}

class MustParametersFormState extends State<MustParametersForm> {
  final _formKey = GlobalKey<FormState>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  final volumeController = TextEditingController();
  final sugarController = TextEditingController();
  final desiredAlcoholController = TextEditingController();
  final desiredSweetnessController = TextEditingController();

  @override
  void dispose() {
    volumeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            autofocus: true,
            decoration: InputDecoration(labelText: "Volume in litres"),
            validator: numberValidator,
            controller: volumeController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Sugar in Blg"),
            validator: numberValidator,
            controller: sugarController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Desired alcohol level in %"),
            validator: numberValidator,
            controller: desiredAlcoholController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Desired sweetness in Blg"),
            validator: numberValidator,
            controller: desiredSweetnessController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _pushInitialParameters();
                }
              },
              child: Text('Submit'),
            ),
          )
        ],
      ),
    );
  }

  String numberValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter value';
    }
//    if (value is! double) {
//      return 'Volume must be a number';
//    }
    return null;
  }

  void _pushInitialParameters() {
    Must must = new Must(double.parse(volumeController.text),
        double.parse(sugarController.text));
    DesiredWineParameters wineParameters =
    new DesiredWineParameters(double.parse(desiredAlcoholController.text),
    double.parse(desiredSweetnessController.text));
    Navigator.of(context).push(
      mustConfirmation(must, wineParameters, _biggerFont),
    );
  }
}

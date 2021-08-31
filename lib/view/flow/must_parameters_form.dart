import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moor/moor.dart' as moor;
import 'package:provider/provider.dart';
import 'package:winemaker/src/database/database.dart';
import 'package:winemaker/view/flow/must_parameters_display.dart';

class MustParametersForm extends StatefulWidget {
  const MustParametersForm({Key? key}) : super(key: key);

  @override
  _MustParametersFormState createState() => _MustParametersFormState();
}

class _MustParametersFormState extends State<MustParametersForm> {
  final _formKey = GlobalKey<FormState>();
  final volumeController = TextEditingController();
  final sugarController = TextEditingController();
  final desiredAlcoholController = TextEditingController();
  final desiredSweetnessController = TextEditingController();

  @override
  void dispose() {
    volumeController.dispose();
    sugarController.dispose();
    desiredAlcoholController.dispose();
    desiredSweetnessController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Provide necessary data'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(labelText: "Volume in litres"),
                keyboardType: TextInputType.number,
                validator: numberValidator,
                controller: volumeController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Sugar in Blg"),
                keyboardType: TextInputType.number,
                validator: numberValidator,
                controller: sugarController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Desired alcohol level in %"),
                keyboardType: TextInputType.number,
                validator: numberValidator,
                controller: desiredAlcoholController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Desired sweetness in Blg"),
                keyboardType: TextInputType.number,
                validator: numberValidator,
                controller: desiredSweetnessController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _pushInitialParameters(context);
                    }
                  },
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
        ));
  }

  String? numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter value';
    }
    if (double.tryParse(value.replaceFirst(',', '.')) == null) {
      return 'Value must be a number';
    }
    return null;
  }

  void _pushInitialParameters(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);
    database.desiredWineDao.addDesiredWine(
      DesiredWineCompanion(
        alcohol: moor.Value(double.parse(desiredAlcoholController.text.replaceFirst(',', '.'))),
        sugar: moor.Value(double.parse(desiredSweetnessController.text.replaceFirst(',', '.'))),
      ),
    );
    database.mustDao.addMust(
      MustCompanion(
        volume: moor.Value(double.parse(volumeController.text.replaceFirst(',', '.'))),
        sugar: moor.Value(double.parse(sugarController.text.replaceFirst(',', '.'))),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MustParametersDisplay()),
    );
  }
}

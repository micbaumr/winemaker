import 'package:flutter/material.dart';
import 'package:winemaker/src/must/must_measurements.dart';
import 'package:winemaker/src/must/must_service.dart';
import 'package:winemaker/src/user_input_utils.dart';
import 'package:winemaker/view/utils/form_builder.dart';

class MeasurementsForm extends StatefulWidget {
  const MeasurementsForm({Key? key}) : super(key: key);

  @override
  _MeasurementsFormState createState() => _MeasurementsFormState();
}

class _MeasurementsFormState extends State<MeasurementsForm> {
  final _formKey = GlobalKey<FormState>();
  final volumeController = TextEditingController();
  final sugarController = TextEditingController();
  late MustService mustService;

  @override
  void dispose() {
    volumeController.dispose();
    sugarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mustService = MustService(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Provide necessary data'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getNumberFormField(volumeController, "Volume in litres", autofocus: true),
              getNumberFormField(sugarController, "Sugar in Blg"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveMeasurements();
                      Navigator.pop(context, true);
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }

  void _saveMeasurements() {
    var volume = parseDoubleInput(volumeController.text);
    var sugar = parseDoubleInput(sugarController.text);
    mustService.saveInitialMustMeasurements(MustMeasurements(volume, sugar));
  }
}

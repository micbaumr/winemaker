import 'package:flutter/material.dart';
import 'package:winemaker/src/calculator/ingredients_calculator.dart';
import 'package:winemaker/src/desired_wine/desired_wine.dart';
import 'package:winemaker/src/desired_wine/desired_wine_service.dart';
import 'package:winemaker/src/future/future_mapper.dart';
import 'package:winemaker/src/must/must_measurements.dart';
import 'package:winemaker/src/must/must_service.dart';
import 'package:winemaker/view/constants.dart';
import 'package:winemaker/view/utils/future_builder.dart';

class MustParametersDisplay extends StatelessWidget {
  const MustParametersDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mustService = MustService(context);
    final desiredWineService = DesiredWineService(context);
    final ingredientsCalculator = IngredientsCalculator(context);

    var _must = mustService.getMustMeasurementsById(1);

    var _desiredWineParameters = desiredWineService.getDesiredWineById(1);

    final List<Widget> mustParameters = getMustParameterDisplay(_desiredWineParameters, _must);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Must parameters'),
        ),
        body: Column(children: [
          Expanded(child: ListView(children: mustParameters)),
          ElevatedButton(
            child: const Text("Calculate required ingredients"),
            onPressed: () {
              //TODO CALCULATE REQUIRED INGREDIENTS
              ingredientsCalculator.calculateAndSaveIngredients();
              Navigator.pop(context, true);
            },
          ),
        ]));
  }

  List<Widget> getMustParameterDisplay(Future<DesiredWine> _desiredWineParameters, Future<MustMeasurements> _must) {
    var _volume = _must.map((must) => must.volume.toString());
    var _sugar = _must.map((must) => must.sugar.toString());
    var _desiredAlcohol = _desiredWineParameters.map((desiredWine) => desiredWine.alcohol.toString());
    var _desiredSugar = _desiredWineParameters.map((desiredWine) => desiredWine.sugar.toString());

    return [
      const Text("Must parameters", textAlign: TextAlign.center, style: biggerFont),
      getTextFutureBuilder(_volume, "Volume", "l"),
      getTextFutureBuilder(_sugar, "Sugar", "Blg"),
      const Divider(),
      const Text("Desired wine parameters", textAlign: TextAlign.center, style: biggerFont),
      getTextFutureBuilder(_desiredAlcohol, "Alcohol", "%"),
      getTextFutureBuilder(_desiredSugar, "Sugar", "Blg"),
    ];
  }
}

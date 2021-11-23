import 'package:flutter/material.dart';
import 'package:winemaker/src/desired_wine/desired_wine.dart';
import 'package:winemaker/src/desired_wine/desired_wine_service.dart';
import 'package:winemaker/src/future/future_mapper.dart';
import 'package:winemaker/src/ingredients/ingredients.dart';
import 'package:winemaker/src/ingredients/ingredients_service.dart';
import 'package:winemaker/src/must/must_measurements.dart';
import 'package:winemaker/src/must/must_service.dart';
import 'package:winemaker/src/recipe/realization/recipe_realization_service.dart';
import 'package:winemaker/view/constants.dart';
import 'package:winemaker/view/utils/future_builder.dart';

class MustParametersDisplay extends StatelessWidget {
  const MustParametersDisplay({Key? key, required this.currentTaskIndex}) : super(key: key);

  final int currentTaskIndex;

  @override
  Widget build(BuildContext context) {
    final mustService = MustService(context);
    final desiredWineService = DesiredWineService(context);
    final recipeRealizationService = RecipeRealizationService(context);
    final ingredientsService = IngredientsService(context);

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
              ingredientsService.saveInitialIngredients(1, Ingredients(15, 30, true, true));
              recipeRealizationService.updateRecipeRealizationCurrentTask(currentTaskIndex + 1);
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

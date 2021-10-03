import 'package:flutter/material.dart';
import 'package:winemaker/src/desired_wine/desired_wine_service.dart';
import 'package:winemaker/src/future/future_mapper.dart';
import 'package:winemaker/src/must/must_service.dart';
import 'package:winemaker/view/constants.dart';
import 'package:winemaker/view/utils/text_future_builder.dart';

class MustParametersDisplay extends StatelessWidget {
  const MustParametersDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mustService = MustService(context);
    final desiredWineService = DesiredWineService(context);

    var _must = mustService.getMustMeasurementsById(1);
    var _volume = _must.map((must) => must.volume.toString());
    var _sugar = _must.map((must) => must.sugar.toString());

    var _desiredWineParameters = desiredWineService.getDesiredWineById(1);
    var _desiredAlcohol = _desiredWineParameters
        .map((desiredWine) => desiredWine.alcohol.toString());
    var _desiredSugar = _desiredWineParameters
        .map((desiredWine) => desiredWine.sugar.toString());

    final List<Widget> mustParameters = [
      const Text("Must parameters",
          textAlign: TextAlign.center, style: biggerFont),
      getTextFutureBuilder(_volume, "Volume", "l"),
      getTextFutureBuilder(_sugar, "Sugar", "Blg"),
      const Divider(),
      const Text("Desired wine parameters",
          textAlign: TextAlign.center, style: biggerFont),
      getTextFutureBuilder(_desiredAlcohol, "Alcohol", "%"),
      getTextFutureBuilder(_desiredSugar, "Sugar", "Blg"),
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Must parameters'),
        ),
        body: Column(children: [
          Expanded(child: ListView(children: mustParameters)),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Start Winemaker"),
          ),
        ]));
  }
}

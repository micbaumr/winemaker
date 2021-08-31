import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winemaker/src/database/database.dart';

class MustParametersDisplay extends StatelessWidget {
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  const MustParametersDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<MyDatabase>(context);

    var _must = database.mustDao.mustById(1);
    var _volume = _must.asStream().map((mustData) => mustData.volume.toString()).first;
    var _sugar = _must.asStream().map((mustData) => mustData.sugar.toString()).first;

    var _desiredWineParameters = database.desiredWineDao.desiredWineById(1);
    var _desiredAlcohol = _desiredWineParameters.asStream().map((mustData) => mustData.alcohol.toString()).first;
    var _desiredSugar = _desiredWineParameters.asStream().map((mustData) => mustData.sugar.toString()).first;

    final List<Widget> mustParameters = [
      Text("Must parameters", textAlign: TextAlign.center, style: _biggerFont),
      getTextFutureBuilder(_volume, "Volume", "l"),
      getTextFutureBuilder(_sugar, "Sugar", "Blg"),
      Divider(),
      Text("Desired wine parameters", textAlign: TextAlign.center, style: _biggerFont),
      getTextFutureBuilder(_desiredAlcohol, "Alcohol", "%"),
      getTextFutureBuilder(_desiredSugar, "Sugar", "Blg"),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('Must parameters'),
        ),
        body: Column(children: [
          Expanded(child: ListView(children: mustParameters)),
          ElevatedButton(
            onPressed: () {},
            child: Text("Start Winemaker"),
          ),
        ]));
  }

  FutureBuilder<String> getTextFutureBuilder(_value, parameterName, parameterUnit) {
    return FutureBuilder<String>(
        future: _value,
        builder: (context, snapshot) {
          return Text("$parameterName: ${snapshot.data} $parameterUnit", style: _biggerFont);
        });
  }
}

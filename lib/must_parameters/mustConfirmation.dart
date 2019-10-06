import 'package:flutter/material.dart';
import 'package:winemaker/desiredWine.dart';
import 'package:winemaker/must_parameters/must.dart';

MaterialPageRoute<void> mustConfirmation(Must must,
    DesiredWineParameters desiredWineParameters, TextStyle _biggerFont) {
  return MaterialPageRoute<void>(
    builder: (BuildContext context) {
      final List<Widget> mustParameters = [
        Text("Must parameters",
            textAlign: TextAlign.center, style: _biggerFont),
        Text("Volume: ${must.volume.toString()} l", style: _biggerFont),
        Text("Suger: ${must.sugarInBlg.toString()} Blg", style: _biggerFont),
        Divider(),
        Text("Desired wine parameters",
            textAlign: TextAlign.center, style: _biggerFont),
        Text("Alcohol: ${desiredWineParameters.alcohol.toString()} %", style: _biggerFont),
        Text("Sugar: ${desiredWineParameters.sugar.toString()} Blg", style: _biggerFont),
      ];

      return Scaffold(
        appBar: AppBar(
          title: Text('Must parameters'),
        ),
        body: ListView(children: mustParameters),
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winemaker/database/database.dart';

class MustParametersDisplay extends StatelessWidget {
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  const MustParametersDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<MyDatabase>(context);
    var _must = database.mustDao.mustById(1);
    var _desiredWineParameters = database.desiredWineDao.desiredWineById(1);
    final List<Widget> mustParameters = [
      Text("Must parameters", textAlign: TextAlign.center, style: _biggerFont),
      FutureBuilder<MustData>(
          future: _must,
          builder: (context, snapshot) {
            return Text("Volume: ${snapshot.data?.volume.toString()} l", style: _biggerFont);
          }),
      FutureBuilder<MustData>(
          future: _must,
          builder: (context, snapshot) {
            return Text("Sugar: ${snapshot.data?.sugar.toString()} Blg", style: _biggerFont);
          }),
      Divider(),
      Text("Desired wine parameters", textAlign: TextAlign.center, style: _biggerFont),
      FutureBuilder<DesiredWineData>(
          future: _desiredWineParameters,
          builder: (context, snapshot) {
            return Text("Alcohol: ${snapshot.data?.alcohol.toString()} %", style: _biggerFont);
          }),
      FutureBuilder<DesiredWineData>(
          future: _desiredWineParameters,
          builder: (context, snapshot) {
            return Text("Sugar: ${snapshot.data?.sugar.toString()} Blg", style: _biggerFont);
          }),
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
}

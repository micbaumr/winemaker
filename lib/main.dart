import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winemaker/database/database.dart';
import 'package:winemaker/flow/progress_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<MyDatabase>(
      create: (context) => MyDatabase(),
      child: MaterialApp(
        title: 'Welcome to Winemaker',
        theme: ThemeData(
          primaryColor: Colors.redAccent,
        ),
        home: StartWineMaker(),
      ),
      dispose: (context, db) => db.close(),
    );
  }
}

class StartWineMaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Winemaker'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Start Winemaker"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProgressScreen()),
              );
            },
          ),
        ));
  }
}

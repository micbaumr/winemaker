import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final int totalNumberOfTasks;
  final int numberOfCompletedTasks;

  const Progress(
      {Key? key,
      required this.totalNumberOfTasks,
      required this.numberOfCompletedTasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var progress = numberOfCompletedTasks / totalNumberOfTasks;

    return Column(
      children: [
        const Text("Your winemaking recipe"),
        LinearProgressIndicator(value: progress),
      ],
    );
  }
}

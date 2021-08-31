import 'package:flutter/material.dart';
import 'package:winemaker/view/progress/task_row.dart';

class Progress extends StatelessWidget {
  final List<TaskRow> tasks;
  final int numberOfCompletedTasks;

  const Progress({Key? key, required this.tasks, required this.numberOfCompletedTasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var totalNumberOfTasks = tasks.length;
    var progress = numberOfCompletedTasks / totalNumberOfTasks;

    return Column(
      children: [
        Text("Your winemaking progress"),
        LinearProgressIndicator(value: progress),
      ],
    );
  }
}

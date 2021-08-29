import 'package:flutter/material.dart';
import 'package:winemaker/task/task_item.dart';

class Progress extends StatelessWidget {
  const Progress({Key? key, required this.tasksAndProgress}) : super(key: key);

  final Map<TaskItem, bool> tasksAndProgress;

  @override
  Widget build(BuildContext context) {
    var numberOfCompletedTasks = tasksAndProgress.values.where((element) => element == true).length;
    var totalNumberOfTasks = tasksAndProgress.length;
    var progress = numberOfCompletedTasks / totalNumberOfTasks;

    return Column(
      children: [
        Text("Your winemaking progress"),
        LinearProgressIndicator(value: progress),
      ],
    );
  }
}

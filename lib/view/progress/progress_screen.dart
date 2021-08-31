import 'package:flutter/material.dart';
import 'package:winemaker/task/task.dart';
import 'package:winemaker/task/task_type.dart';
import 'package:winemaker/view/progress/progress.dart';
import 'package:winemaker/view/progress/task_list.dart';
import 'package:winemaker/view/progress/task_row.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final int currentTaskIndex = 1;
  final List<Task> tasks = [
    Task("Must parameters measurement", TaskType.measurement),
    Task("Must parameters displayed", TaskType.simpleTask)
  ];

  @override
  Widget build(BuildContext context) {
    final List<TaskRow> taskRows = [for (var i = 0; i < tasks.length; i++) buildTaskRow(i)];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Winemaker'),
        ),
        body: Column(
          children: [
            Progress(tasks: taskRows, numberOfCompletedTasks: currentTaskIndex),
            TaskList(tasks: taskRows),
          ],
        ));
  }

  TaskRow buildTaskRow(int taskIndex) => TaskRow(
      label: tasks[taskIndex].name,
      taskScreen: tasks[taskIndex].type.getTaskWidget(),
      isCompleted: currentTaskIndex > taskIndex);
}

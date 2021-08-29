import 'package:flutter/material.dart';
import 'package:winemaker/flow/must_parameters_display.dart';
import 'package:winemaker/progress/progress.dart';
import 'package:winemaker/task/task_item.dart';
import 'package:winemaker/task/task_list.dart';
import 'package:winemaker/task/task_type.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final Map<TaskItem, bool> tasksAndProgress = {
    TaskItem(label: "Must parameters measurement", taskScreen: TaskType.measurement.getTask()): true,
    TaskItem(label: "Must parameters displayed", taskScreen: MustParametersDisplay()): false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Winemaker'),
        ),
        body: Column(
          children: [
            Progress(tasksAndProgress: tasksAndProgress),
            TaskList(tasksAndProgress: tasksAndProgress),
          ],
        ));
  }
}

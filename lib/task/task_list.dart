import 'package:flutter/material.dart';
import 'package:winemaker/task/task_item.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key, required this.tasksAndProgress}) : super(key: key);

  final Map<TaskItem, bool> tasksAndProgress;

  @override
  _TaskListState createState() => _TaskListState(tasksAndProgress);
}

class _TaskListState extends State<TaskList> {
  final Map<TaskItem, bool> tasksAndProgress;

  _TaskListState(this.tasksAndProgress);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tasksAndProgress.keys.toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:winemaker/view/recipe/task_row.dart';

class TaskList extends StatefulWidget {
  final List<TaskRow> tasks;

  const TaskList({Key? key, required this.tasks}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState(tasks);
}

class _TaskListState extends State<TaskList> {
  final List<TaskRow> tasks;

  _TaskListState(this.tasks);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tasks,
    );
  }
}

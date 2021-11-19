import 'package:flutter/material.dart';
import 'package:winemaker/view/recipe/task_row.dart';

class TaskList extends StatelessWidget {
  final List<TaskRow> tasks;

  const TaskList({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tasks,
    );
  }
}

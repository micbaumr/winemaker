import 'package:flutter/material.dart';
import 'package:winemaker/src/recipe/recipe.dart';
import 'package:winemaker/src/recipe/task_type.dart';
import 'package:winemaker/view/recipe/progress.dart';
import 'package:winemaker/view/recipe/task_list.dart';
import 'package:winemaker/view/recipe/task_row.dart';

class RecipeView extends StatelessWidget {
  const RecipeView({Key? key, required this.recipe}) : super(key: key);

  final int currentTaskIndex = 1;
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final List<TaskRow> taskRows = [
      for (var i = 0; i < recipe.tasks.length; i++) buildTaskRow(i)
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Winemaker'),
        ),
        body: Column(
          children: [
            Progress(
                totalNumberOfTasks: taskRows.length,
                numberOfCompletedTasks: currentTaskIndex),
            TaskList(tasks: taskRows),
          ],
        ));
  }

  TaskRow buildTaskRow(int taskIndex) {
    var task = recipe.tasks[taskIndex];
    return TaskRow(
        label: task.name,
        taskScreen: task.type.getTaskWidget(),
        isCompleted: currentTaskIndex > taskIndex);
  }
}

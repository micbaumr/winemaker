import 'package:flutter/material.dart';
import 'package:winemaker/src/constants/recipes.dart';
import 'package:winemaker/src/recipe/realization/recipe_realization.dart';
import 'package:winemaker/src/recipe/realization/recipe_realization_service.dart';
import 'package:winemaker/src/recipe/task.dart';
import 'package:winemaker/src/recipe/task_type.dart';
import 'package:winemaker/view/recipe/progress.dart';
import 'package:winemaker/view/recipe/task_list.dart';
import 'package:winemaker/view/recipe/task_row.dart';

class RecipeViewWrapper extends StatelessWidget {
  const RecipeViewWrapper({Key? key, required this.realizationId}) : super(key: key);

  final int realizationId;

  @override
  Widget build(BuildContext context) {
    final recipeRealizationService = RecipeRealizationService(context);

    recipeRealizationService.saveRecipeRealization(RecipeRealization(0, AvailableRecipes.redWine));
    var _recipeRealization = recipeRealizationService.getRecipeRealizationById(realizationId);

    return FutureBuilder<RecipeRealization>(
      future: _recipeRealization,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RecipeView(
            tasks: snapshot.data?.recipe.getRecipe().tasks ?? List.empty(),
            currentTaskIndex: snapshot.data?.currentTask ?? 0,
          );
        } else if (snapshot.hasError) {
          return Text('Error: $snapshot');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class RecipeView extends StatelessWidget {
  const RecipeView({Key? key, required this.tasks, required this.currentTaskIndex}) : super(key: key);

  final List<Task> tasks;
  final int currentTaskIndex;

  @override
  Widget build(BuildContext context) {
    final List<TaskRow> taskRows = [for (var i = 0; i < tasks.length; i++) buildTaskRow(i)];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Winemaker'),
        ),
        body: Column(
          children: [
            Progress(totalNumberOfTasks: tasks.length, numberOfCompletedTasks: currentTaskIndex),
            TaskList(tasks: taskRows),
          ],
        ));
  }

  TaskRow buildTaskRow(int taskIndex) {
    var task = tasks[taskIndex];
    return TaskRow(label: task.name, taskScreen: task.type.getTaskWidget(currentTaskIndex), isCompleted: (currentTaskIndex) > taskIndex);
  }
}

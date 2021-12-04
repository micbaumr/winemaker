import 'package:flutter/material.dart';
import 'package:winemaker/src/constants/recipes.dart';
import 'package:winemaker/src/recipe/realization/recipe_realization.dart';
import 'package:winemaker/src/recipe/realization/recipe_realization_service.dart';
import 'package:winemaker/src/recipe/task.dart';
import 'package:winemaker/src/recipe/task_type.dart';
import 'package:winemaker/view/recipe/progress.dart';
import 'package:winemaker/view/recipe/task_list.dart';
import 'package:winemaker/view/recipe/task_row.dart';

class RecipeViewWrapper extends StatefulWidget {
  const RecipeViewWrapper({Key? key, required this.realizationId}) : super(key: key);

  final int realizationId;

  @override
  State<RecipeViewWrapper> createState() => _RecipeViewWrapperState();
}

class _RecipeViewWrapperState extends State<RecipeViewWrapper> {
  @override
  Widget build(BuildContext context) {
    final recipeRealizationService = RecipeRealizationService(context);

    recipeRealizationService.saveRecipeRealization(RecipeRealization(0, AvailableRecipes.redWine));
    var _recipeRealization = recipeRealizationService.getRecipeRealizationById(widget.realizationId);

    return FutureBuilder<RecipeRealization>(
      future: _recipeRealization,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var currentTaskIndex = snapshot.data?.currentTask ?? 0;
          return RecipeView(
            tasks: snapshot.data?.recipe.getRecipe().tasks ?? List.empty(),
            currentTaskIndex: currentTaskIndex,
            recipeRealizationService: recipeRealizationService,
            onTaskComplete: () => completeTaskAndRefresh(recipeRealizationService, currentTaskIndex),
          );
        } else if (snapshot.hasError) {
          return Text('Error: $snapshot');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  void completeTaskAndRefresh(RecipeRealizationService recipeRealizationService, int currentTaskIndex) {
    recipeRealizationService.updateRecipeRealizationCurrentTask(currentTaskIndex + 1);
    setState(() {});
  }
}

class RecipeView extends StatelessWidget {
  const RecipeView(
      {Key? key, required this.tasks, required this.currentTaskIndex, required this.recipeRealizationService, required this.onTaskComplete})
      : super(key: key);

  final List<Task> tasks;
  final int currentTaskIndex;
  final RecipeRealizationService recipeRealizationService;
  final Function() onTaskComplete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Winemaker'),
        ),
        body: Column(
          children: [
            Progress(totalNumberOfTasks: tasks.length, numberOfCompletedTasks: currentTaskIndex),
            buildTaskList(),
          ],
        ));
  }

  TaskList buildTaskList() {
    final List<TaskRow> taskRows = [for (var i = 0; i < tasks.length; i++) buildTaskRow(i)];
    return TaskList(tasks: taskRows);
  }

  TaskRow buildTaskRow(int taskIndex) {
    var task = tasks[taskIndex];
    return TaskRow(
      label: task.name,
      taskScreen: task.type.getTaskWidget(),
      isCompleted: (currentTaskIndex) > taskIndex,
      isAvailable: currentTaskIndex == taskIndex,
      onCompleted: onTaskComplete,
    );
  }
}

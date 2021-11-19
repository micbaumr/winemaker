import 'package:flutter/cupertino.dart';
import 'package:winemaker/view/task/adding_ingredients/ingredients_screen.dart';
import 'package:winemaker/view/task/desired_wine_form.dart';
import 'package:winemaker/view/task/measurements_form.dart';
import 'package:winemaker/view/task/must_parameters_display.dart';

enum TaskType { simpleTask, desiredWineForm, measurementForm, addingIngredients, taskWithNotification }

extension TaskTypeExtension on TaskType {
  Widget getTaskWidget(int currentTaskIndex, {Map<String, Object>? args}) {
    switch (this) {
      case TaskType.simpleTask:
        // TODO: return correct widget
        return MustParametersDisplay(currentTaskIndex: currentTaskIndex);

      case TaskType.desiredWineForm:
        return DesiredWineForm(currentTaskIndex: currentTaskIndex);

      case TaskType.measurementForm:
        return MeasurementsForm(currentTaskIndex: currentTaskIndex);

      case TaskType.addingIngredients:
        return IngredientsScreen(currentTaskIndex: currentTaskIndex);

      case TaskType.taskWithNotification:
        // TODO: return correct widget
        return MeasurementsForm(currentTaskIndex: currentTaskIndex);
    }
  }
}

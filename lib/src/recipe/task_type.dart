import 'package:flutter/material.dart';
import 'package:winemaker/view/task/adding_ingredients/ingredients_screen.dart';
import 'package:winemaker/view/task/desired_wine_form.dart';
import 'package:winemaker/view/task/measurements_form.dart';
import 'package:winemaker/view/task/must_parameters_display.dart';

enum TaskType { description, desiredWineForm, measurementForm, addingIngredients, timeNotification, calculations }

extension TaskTypeExtension on TaskType {
  Widget getTaskWidget({Map<String, Object>? args}) {
    switch (this) {
      case TaskType.description:
        // TODO: return correct widget
        return const MustParametersDisplay();

      case TaskType.desiredWineForm:
        return const DesiredWineForm();

      case TaskType.measurementForm:
        return const MeasurementsForm();

      case TaskType.addingIngredients:
        return const IngredientsScreen();

      case TaskType.timeNotification:
        // TODO: return correct widget
        return const MeasurementsForm();

      case TaskType.calculations:
        return const MustParametersDisplay();
    }
  }
}

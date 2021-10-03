import 'package:flutter/cupertino.dart';
import 'package:winemaker/view/task/desired_wine_form.dart';
import 'package:winemaker/view/task/measurements_form.dart';
import 'package:winemaker/view/task/must_parameters_display.dart';

enum TaskType {
  simpleTask,
  desiredWineForm,
  measurementForm,
  addingIngredients,
  taskWithNotification
}

extension TaskTypeExtension on TaskType {
  Widget getTaskWidget({Map<String, Object>? args}) {
    switch (this) {
      case TaskType.simpleTask:
        // TODO: return correct widget
        return MustParametersDisplay();

      case TaskType.desiredWineForm:
        return DesiredWineForm();

      case TaskType.measurementForm:
        return MeasurementsForm();

      case TaskType.addingIngredients:
        // TODO: return correct widget
        return MeasurementsForm();

      case TaskType.taskWithNotification:
        // TODO: return correct widget
        return MeasurementsForm();
    }
  }
}

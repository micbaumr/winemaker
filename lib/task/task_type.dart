import 'package:flutter/cupertino.dart';
import 'package:winemaker/flow/must_parameters_form.dart';

enum TaskType { simpleTask, measurement, taskWithMustModification, taskWithNotification }

extension TaskTypeExtension on TaskType {
  Widget getTask({Map<String, Object>? args}) {
    switch (this) {
      case TaskType.simpleTask:
        // TODO: return correct widget
        return MustParametersForm();
      case TaskType.measurement:
        return MustParametersForm();
      case TaskType.taskWithMustModification:
        // TODO: return correct widget
        return MustParametersForm();
      case TaskType.taskWithNotification:
        // TODO: return correct widget
        return MustParametersForm();
    }
  }
}

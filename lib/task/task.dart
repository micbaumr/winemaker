import 'package:winemaker/task/task_type.dart';

class Task {
  String name;
  TaskType type;
  Map<String, Object>? args;

  Task(this.name, this.type);

  Task.withArgs(this.name, this.type, this.args);
}

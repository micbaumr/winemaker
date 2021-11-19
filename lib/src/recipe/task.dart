import 'task_type.dart';

class Task {
  final String name;
  final TaskType type;
  final Map<String, Object>? args;

  Task(this.name, this.type, {this.args});
}

import 'package:flutter/material.dart';

class TaskRow extends StatelessWidget {
  final String label;
  final Widget taskScreen;
  final bool isCompleted;
  final bool isAvailable;
  final Function() onCompleted;

  const TaskRow(
      {Key? key, required this.label, required this.taskScreen, required this.isCompleted, required this.onCompleted, required this.isAvailable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(value: isCompleted, onChanged: null),
        ElevatedButton(
          child: Text(label),
          onPressed: isAvailable ? () => _navigateToTaskScreenAndCompleteTask(context) : null,
        ),
      ],
    );
  }

  void _navigateToTaskScreenAndCompleteTask(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => taskScreen),
    );
    if (result == true) {
      onCompleted();
    }
  }
}

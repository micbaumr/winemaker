import 'package:flutter/material.dart';

class TaskRow extends StatelessWidget {
  final String label;
  final Widget taskScreen;
  final bool isCompleted;

  const TaskRow({Key? key, required this.label, required this.taskScreen, required this.isCompleted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(value: isCompleted, onChanged: null),
        ElevatedButton(
          child: Text(label),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => taskScreen),
            );
          },
        ),
      ],
    );
  }
}

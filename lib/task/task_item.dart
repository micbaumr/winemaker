import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String label;
  final Widget taskScreen;

  const TaskItem({Key? key, required this.label, required this.taskScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(value: false, onChanged: null),
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

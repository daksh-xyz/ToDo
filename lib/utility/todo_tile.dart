import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 25, 25, 0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: const Color.fromARGB(255, 59, 57, 57),
              ),
              Text(
                taskName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.white,
                    decorationThickness: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

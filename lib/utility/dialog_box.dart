import 'package:flutter/material.dart';
import 'package:to_do/utility/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[200],
      content: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: SizedBox(
          height: 120,
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new task",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                    onPressed: onSave,
                    text: "Save",
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  MyButton(
                    onPressed: onCancel,
                    text: "Cancel",
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

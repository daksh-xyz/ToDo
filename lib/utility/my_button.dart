import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.deepPurple[200],
      child: Text(
        text,
        style: const TextStyle(color: Color.fromARGB(224, 255, 255, 255)),
      ),
    );
  }
}

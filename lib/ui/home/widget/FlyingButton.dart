import 'package:flutter/material.dart';
class FlyingButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FlyingButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
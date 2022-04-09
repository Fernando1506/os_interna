import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    Key? key,
    this.text = "",
    required this.onTap,
  }) : super(key: key);

  String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
      child: Text(text),
      onPressed: onTap,
    ));
  }
}

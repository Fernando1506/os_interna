import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({Key? key, this.text = "", required this.onTap, required this.width}) : super(key: key);

  String text;
  double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: ElevatedButton(
          child: Text(text),
          onPressed: onTap,
        ));
  }
}

class ButtonCancelar extends StatelessWidget {
  ButtonCancelar({Key? key, this.text = "", required this.onTap, required this.width}) : super(key: key);

  String text;
  double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: ElevatedButton(
          child: Text(text),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.red,
            side: BorderSide(color: Colors.red, width: 1),
          ),
          onPressed: onTap,
        ));
  }
}

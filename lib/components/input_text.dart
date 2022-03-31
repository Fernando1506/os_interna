import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  InputText({
    Key? key,
    required this.label,
    required this.width,
    required this.controller,
  }) : super(key: key);

  String label = "";
  double width;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 35,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          // hintText: 'Digite seu nome',
          labelText: label,
        ),
      ),
    );
  }
}

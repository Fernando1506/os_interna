import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  InputText({
    Key? key,
    required this.label,
    required this.width,
    required this.controller,
    required this.enabled,
    required this.validator,
    // required this.keyboardType,
  }) : super(key: key);

  String label = "";
  double width;

  bool enabled = true;
  TextEditingController controller;
  final formKey = GlobalKey<FormState>();
  bool validate = false;
  // final TextInputType keyboardType;
  String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      child: TextFormField(
        validator: validator,
        // keyboardType: keyboardType,
        enabled: enabled,
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

class InputTextArea extends StatelessWidget {
  InputTextArea({
    Key? key,
    required this.label,
    required this.width,
    required this.height,
    required this.controller,
    required this.maxline,
  }) : super(key: key);

  String label = "";
  double width;
  double height;
  int maxline;

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextFormField(
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Obrigatório!';
        //   }
        //   return null;
        // },
        maxLines: maxline,
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

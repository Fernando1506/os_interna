import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  List<String> dropDownItems = [];

  void Function(String?)? onChanged;
  String hintText = "";
  String label = "";
  double largura;
  double altura;
  String dropDownValue = "";
  bool hasValue;

  Select({
    required this.dropDownItems,
    required this.onChanged,
    required this.hintText,
    required this.label,
    required this.largura,
    this.altura = 45,
    required this.dropDownValue,
    this.hasValue = true,
  });

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  // String dropDownValue = "";

  // bool hasValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.largura,
      height: widget.altura,
      child: DropdownButtonFormField<String>(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Obrigatório!';
          }
          return null;
        },
        value: widget.hasValue ? widget.dropDownValue : null,
        hint: Text(widget.hintText),
        items: widget.dropDownItems.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          labelText: widget.label,
          contentPadding:
              EdgeInsets.only(left: 15, top: 14, bottom: 14, right: 15),
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}

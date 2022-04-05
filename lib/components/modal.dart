import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:os_interna/components/input_text.dart';

import '../components/buttons.dart';
import '../relatorio/relatorio.view.dart';

class FormModal extends StatelessWidget {
  FormModal({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    this.idRegistro = "",
  }) : super(key: key);

  double width = 550;
  double height = 60;
  String text = "";
  String idRegistro = "";
  TextEditingController controleInputNome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text(text),
        ],
      ),
      content: Container(
        width: width,
        height: height,
        child: Column(
          children: [],
        ),
      ),
      actions: <Widget>[
        Button(text: "Adicionar", onTap: () {}),
      ],
    );
  }
}

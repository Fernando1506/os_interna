import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/buttons.dart';
import '../components/input_text.dart';
import '../relatorio/relatorio.view.dart';

class CadastroClienteView extends StatelessWidget {
  const CadastroClienteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text("Cadastro - Cliente"),
        ],
      ),
      content: Container(
        width: 120,
        height: 80,
        child: InputText(
            enabled: true,
            controller: TextEditingController(),
            label: "Nome",
            width: 100),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Button(
              text: "Adicionar",
              onTap: () {},
            ),
            Button(
              text: "Cancelar",
              onTap: () {
                Get.offAll(RelatorioView());
              },
            ),
          ],
        ),
      ],
    );
  }
}

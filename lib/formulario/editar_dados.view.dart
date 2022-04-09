import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:os_interna/components/input_text.dart';

import '../components/buttons.dart';
import '../relatorio/relatorio.model.dart';
import '../relatorio/relatorio.view.dart';
import 'editar_dados.controller.dart';

class EditarDadosView extends StatelessWidget {
  EditarDadosView({
    Key? key,
    required this.item,
    required this.nomeController,
    required this.ageController,
    required this.roleController,
    required this.controllerEditarDados,
  }) : super(key: key);

  final MovimentosDadosModel item;
  EditarDadosController controllerEditarDados;
  TextEditingController nomeController;
  TextEditingController ageController;
  TextEditingController roleController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text('Editar'),
        ],
      ),
      content: Container(
        width: 550,
        height: 60,
        child: Column(
          children: [
            Row(
              children: [
                InputText(
                  label: '',
                  width: 200,
                  controller: nomeController,
                  // prefixText: item.name,
                ),
                InputText(
                  label: '',
                  width: 100,
                  controller: ageController,
                  // prefixText: item.name,
                ),
                InputText(
                  label: '',
                  width: 200,
                  controller: roleController,
                  // prefixText: item.name,
                )
              ],
            )
          ],
        ),
      ),
      actions: <Widget>[
        Button(
            text: "Editar",
            onTap: () {
              controllerEditarDados.editarDados(item);
            }),
        Button(
            text: "Fechar",
            onTap: () {
              Get.offAll(RelatorioView());
            }),
      ],
    );
  }
}

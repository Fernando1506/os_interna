import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:os_interna/components/input_text.dart';

import '../components/buttons.dart';
import '../relatorio/relatorio.view.dart';
import 'cadastrar_dados.controller.dart';

class FormModal extends StatelessWidget {
  FormModal({Key? key}) : super(key: key);

  CadastrarDadosController controller = CadastrarDadosController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text("Cadastrar Ordem de Serviço"),
        ],
      ),
      content: Container(
        width: 550,
        height: 60,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InputText(
                    label: 'Name',
                    width: 200,
                    controller: controller.nomeController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InputText(
                      label: 'Age',
                      width: 100,
                      controller: controller.ageController),
                ),
                InputText(
                    label: 'Role',
                    width: 200,
                    controller: controller.roleController),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Button(
            text: "Adicionar",
            onTap: () {
              controller.gravarDados();
            }),
        Button(
            text: "Ler Valores",
            onTap: () {
              controller.lerTodosValoresDeUmPath();
            }),
        Button(
            text: "Cancelar",
            onTap: () {
              Get.offAll(RelatorioView());
            }),
      ],
    );
  }
}

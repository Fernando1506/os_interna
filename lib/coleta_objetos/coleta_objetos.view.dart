import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:os_interna/cadastro_ordem_servico/cadastro_ordem_servico.controller.dart';
import 'package:os_interna/components/buttons.dart';
import 'package:os_interna/components/input_text.dart';

import 'coleta_objetos.controller.dart';
import 'coleta_objetos.controller.dart';

class ColetaObjetosView extends StatelessWidget {
  ColetaObjetosView({
    super.key,
    required this.idDados,
  }) {
    controllerCadastrarColeta = CadastrarColetaController(idDados: idDados);
  }

  late String idDados;
  late CadastrarColetaController controllerCadastrarColeta;
  late CadastrarDadosController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text("Coleta"),
        ],
      ),
      content: Container(
        width: 150,
        height: 160,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InputText(label: "Origem", width: 150, controller: controllerCadastrarColeta.origemColeta, enabled: true, validator: (value) {}),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InputText(label: "Data Solicitação", width: 150, controller: controllerCadastrarColeta.dataSolicitacaoColeta, enabled: true, validator: (value) {}),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InputText(label: "Código do Objeto", width: 150, controller: controllerCadastrarColeta.codigoObjeto, enabled: true, validator: (value) {}),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                  child: Button(
                width: 150,
                text: "Solicitar",
                onTap: () {
                  controllerCadastrarColeta.gravarDados();
                  controller.limparCampos();
                },
              ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                  child: Button(
                width: 150,
                text: "Cancelar",
                onTap: () {
                  Get.back(result: false);
                },
              ))
            ],
          ),
        ),
      ],
    );
  }
}

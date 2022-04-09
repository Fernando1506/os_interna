import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:os_interna/components/input_text.dart';

import '../components/buttons.dart';
import '../relatorio/relatorio.view.dart';
import 'cadastrar_dados.controller.dart';

class CadastrarDadosView extends StatelessWidget {
  CadastrarDadosView({
    Key? key,
    required this.idDados,
  }) : super(key: key) {
    controller = CadastrarDadosController(idDados: idDados);
  }

  String idDados;

  late CadastrarDadosController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text("Movimentos - Ordem de Serviço"),
        ],
      ),
      content: FutureBuilder(
          future: controller.carregarCadastro(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
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
              );
            } else {
              return Container(
                width: 550,
                height: 60,
              );
            }
          }),
      actions: <Widget>[
        Row(
          children: [
            Button(
              text: "Adicionar",
              onTap: () {
                controller.gravarDados(newData: true);
              },
            ),
            buildGravarButton(),
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

  Widget buildGravarButton() {
    if (controller.idDados.isNotEmpty) {
      return Button(
        text: "Gravar",
        onTap: () {
          controller.gravarDados(newData: false);
        },
      );
    } else {
      return Container();
    }
  }
}

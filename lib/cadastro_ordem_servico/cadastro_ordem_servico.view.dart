import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:os_interna/components/input_text.dart';
import 'package:os_interna/page/homepage.view.dart';

import '../components/buttons.dart';

import '../relatorio/relatorio.view.dart';
import 'cadastro_ordem_servico.controller.dart';

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
          Text("Cadastro - Ordem de Serviço"),
        ],
      ),
      content: FutureBuilder(
          future: controller.carregarCadastro(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                width: 700,
                height: 280,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InputText(
                            enabled: false,
                            label: 'Nº O.S',
                            width: 100,
                            controller: controller.numeroOs,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InputText(
                            enabled: true,
                            label: 'Data',
                            width: 120,
                            controller: TextEditingController(),
                          ),
                        ),
                        Expanded(
                          child: InputText(
                            enabled: true,
                            label: 'Cliente',
                            width: 200,
                            controller: controller.nomeController,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InputText(
                                enabled: true,
                                label: 'Módulo',
                                width: 100,
                                controller: controller.moduloController),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InputText(
                                enabled: true,
                                label: 'Série',
                                width: 100,
                                controller: controller.serieController),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InputText(
                                enabled: true,
                                label: 'Device ID',
                                width: 100,
                                controller: controller.device_idController),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InputText(
                              enabled: true,
                              label: 'Placa',
                              width: 120,
                              controller: TextEditingController(),
                            ),
                          ),
                          Expanded(
                            child: InputText(
                                enabled: true,
                                label: 'Status',
                                width: 180,
                                controller: controller.statusController),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          Expanded(
                            child: InputTextArea(
                                label: 'Observação Geral',
                                maxline: 5,
                                width: 200,
                                height: 130,
                                controller: controller.obs_geralController),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                width: 700,
                height: 280,
              );
            }
          }),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddButton(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: buildGravarButton(),
            ),
            Button(
              text: "Cancelar",
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildAddButton() {
    if (controller.idDados.isEmpty) {
      return Button(
        text: "Adicionar",
        onTap: () {
          controller.gravarDados(newData: true);
        },
      );
    } else {
      return Container();
    }
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

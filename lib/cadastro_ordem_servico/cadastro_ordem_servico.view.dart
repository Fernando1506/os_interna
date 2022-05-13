import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:os_interna/components/input_text.dart';
import 'package:os_interna/components/select.component.dart';

import 'package:os_interna/page/homepage.view.dart';

import '../components/buttons.dart';

import 'cadastro_ordem_servico.controller.dart';

class CadastrarDadosView extends StatelessWidget {
  CadastrarDadosView({
    Key? key,
    required this.idDados,
    required this.atualizarRelatorio,
  }) : super(key: key) {
    controller = CadastrarDadosController(idDados: idDados);
  }

  String idDados;

  Function() atualizarRelatorio;

  late CadastrarDadosController controller;
  final formKey = GlobalKey<FormState>();

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
                height: 420,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // Row(children: [
                      //   Container(
                      //     color: Colors.amber,
                      //     width: 700,
                      //     height: 40,
                      //     child: Row(
                      //       children: const [
                      //         Text(
                      //           "Mensagem de Confirmação!",
                      //         ),
                      //       ],
                      //     ),
                      //   )
                      // ]),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: InputText(
                              validator: (value) {},
                              enabled: false,
                              label: 'Nº O.S',
                              width: 100,
                              controller: controller.numeroOs,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InputText(
                              validator: (value) {},
                              enabled: false,
                              label: 'Data',
                              width: 120,
                              controller: controller.dataCadastroController,
                            ),
                          ),
                          Expanded(
                            child: InputText(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Obrigatório!';
                                }
                                return null;
                              },
                              enabled: true,
                              label: 'Cliente',
                              width: 200,
                              controller: controller.nomeController,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Select(
                                  hasValue: true,
                                  dropDownValue:
                                      controller.moduloController.text,
                                  largura: 120,
                                  label: "",
                                  onChanged: (value) {
                                    controller.moduloController.text = value!;
                                  },
                                  hintText: "Módulo",
                                  dropDownItems: const [
                                    "---",
                                    "Seg-100",
                                    "Seg-200",
                                    "IC-100",
                                    "IC-150",
                                    "IC-150B",
                                    "IC-150C",
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: InputText(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Obrigatório!';
                                    }
                                    // if (!value.isNumericOnly) {
                                    //   return 'Inválido!';
                                    // }
                                    return null;
                                  },
                                  enabled: true,
                                  label: 'Série',
                                  width: 90,
                                  controller: controller.serieController),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: InputText(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Obrigatório!';
                                    }
                                    if (!value.isNumericOnly) {
                                      return 'Inválido!';
                                    }
                                    return null;
                                  },
                                  enabled: true,
                                  label: 'Device ID',
                                  width: 80,
                                  controller: controller.device_idController),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Select(
                                  hasValue: true,
                                  dropDownValue:
                                      controller.operadoraController.text,
                                  largura: 180,
                                  label: "",
                                  onChanged: (value) {
                                    controller.operadoraController.text =
                                        value!;
                                  },
                                  hintText: "Operadora",
                                  dropDownItems: const [
                                    "---",
                                    "ALGAR",
                                    "CTBC",
                                    "CTBC Cerradão",
                                    "CTBC Claro&TIM",
                                    "IoT",
                                    "IoT Cerradão",
                                    "IoT Guaíra",
                                    "TIM",
                                    "VIVO",
                                  ]),
                            ),
                            Expanded(
                              child: InputText(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Obrigatório!';
                                    }
                                    return null;
                                  },
                                  enabled: true,
                                  label: 'Placa',
                                  width: 230,
                                  controller: controller.placaController),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: InputText(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Obrigatório!';
                                  }
                                  return null;
                                },
                                enabled: true,
                                label: 'O.S Ref.:',
                                width: 100,
                                controller: controller.os_referenciaController,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Select(
                                  hasValue: true,
                                  dropDownValue:
                                      controller.estoqueController.text,
                                  largura: 180,
                                  label: "",
                                  onChanged: (value) {
                                    controller.estoqueController.text = value!;
                                  },
                                  hintText: "Estoque",
                                  dropDownItems: const [
                                    "---",
                                    "Contrato",
                                    "Manutenção",
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Expanded(
                                child: Select(
                                    hasValue: true,
                                    dropDownValue:
                                        controller.statusController.text,
                                    largura: 250,
                                    label: "",
                                    onChanged: (value) {
                                      controller.statusController.text = value!;
                                    },
                                    hintText: "Status",
                                    dropDownItems: const [
                                      "---",
                                      "Solicitar Coleta",
                                      "Em Transito",
                                      "Aguardando NF",
                                      "Liberado p/ Manutenção",
                                      "Liberado p/ Estoque",
                                      "Em Estoque",
                                    ]),
                              ),
                            ),
                            Expanded(
                              child: Button(
                                text: "Coleta",
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: const [
                            Text("Chicote:"),
                            Checkbox(
                                side: BorderSide(
                                  color: Colors.black26,
                                ),
                                value: true,
                                onChanged: null),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text("Seg-100"),
                            ),
                            Checkbox(
                                side: BorderSide(
                                  color: Colors.black26,
                                ),
                                value: false,
                                onChanged: null),
                            Padding(
                              padding: EdgeInsets.only(right: 80),
                              child: Text("Seg-200"),
                            ),
                            Text("Antena:"),
                            Checkbox(
                                side: BorderSide(
                                  color: Colors.black26,
                                ),
                                value: false,
                                onChanged: null),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text("GPS"),
                            ),
                            Checkbox(
                                side: BorderSide(
                                  color: Colors.black26,
                                ),
                                value: false,
                                onChanged: null),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text("3dB"),
                            ),
                            Checkbox(
                                side: BorderSide(
                                  color: Colors.black26,
                                ),
                                value: false,
                                onChanged: null),
                            Text("7dB"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Container(
                              width: 700,
                              height: 180,
                              child: DefaultTabController(
                                length: 4,
                                child: Scaffold(
                                  appBar: PreferredSize(
                                    preferredSize: Size.fromHeight(
                                        MediaQuery.of(context).size.height),
                                    child: Container(
                                      height: 50.0,
                                      child: const TabBar(
                                        labelColor: Colors.black,
                                        isScrollable: true,
                                        tabs: [
                                          Tab(
                                            text: "Observação Geral",
                                          ),
                                          Tab(
                                            text: "Problema Informado",
                                          ),
                                          Tab(
                                            text: "Problema Constatado",
                                          ),
                                          Tab(
                                            text: "Observação Técnica",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  body: TabBarView(
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Expanded(
                                            child: InputTextArea(
                                                label: 'Observação Geral',
                                                maxline: 5,
                                                width: 700,
                                                height: 160,
                                                controller: controller
                                                    .obs_geralController),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Expanded(
                                            child: InputTextArea(
                                                label: 'Problema Informado',
                                                maxline: 5,
                                                width: 700,
                                                height: 150,
                                                controller: controller
                                                    .problema_informadoController),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Expanded(
                                            child: InputTextArea(
                                                label: 'Problema Constatado',
                                                maxline: 5,
                                                width: 700,
                                                height: 150,
                                                controller: controller
                                                    .problema_constatadoController),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Expanded(
                                            child: InputTextArea(
                                                label: 'Observação Técnica',
                                                maxline: 5,
                                                width: 700,
                                                height: 150,
                                                controller: controller
                                                    .obs_tecnicaController),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                width: 700,
                height: 420,
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
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(builder: (context) => RelatorioView()),
                //     (Route<dynamic> route) => false);
                atualizarRelatorio();
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
          if (formKey.currentState!.validate()) {
            controller.gravarDados(newData: true);
          } else {
            return;
          }
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
          if (formKey.currentState!.validate()) {
            controller.gravarDados(newData: false);
          } else {
            return;
          }
        },
      );
    } else {
      return Container();
    }
  }
}

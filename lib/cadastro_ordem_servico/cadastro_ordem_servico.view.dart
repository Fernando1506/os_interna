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
      buttonPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Text("Cadastro - Ordem de Serviço"),
        ],
      ),
      content: FutureBuilder(
          future: controller.carregarCadastro(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                child: Container(
                  width: 700,
                  height: Get.height * .62,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Obx(
                          () {
                            return Row(children: [
                              controller.showMsgConfirmacao.value
                                  ? Container(
                                      padding: EdgeInsets.all(5),
                                      color: Color(controller.colorFundoMensagem),
                                      width: 700,
                                      height: 30,
                                      child: Row(
                                        children: [
                                          Text(
                                            controller.msgConfirmacao.value,
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(controller.colorMensagem)),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                            ]);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
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
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
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
                            ),
                            InputText(
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
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
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
                                    label: 'Placa',
                                    width: 110,
                                    controller: controller.placaController),
                              ),
                              Obx(() {
                                var value = controller.inputEstoqueValue.value;
                                var p = "";

                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Select(
                                      // hasValue: true,
                                      // dropDownValue: controller.estoqueController.text,
                                      // hasValue: hasValue,
                                      // autoValidate: ,
                                      dropDownValue: controller.inputEstoqueValue.value,
                                      autoValidate: controller.dropdownAutoValidate.last,
                                      largura: 180,
                                      label: "",
                                      onChanged: (value) {
                                        controller.estoqueController.text = value!;
                                        controller.inputEstoqueValue.value = value;
                                      },
                                      hintText: "Estoque",
                                      dropDownItems: const [
                                        "---",
                                        "Contrato",
                                        "Manutenção",
                                      ]),
                                );
                              }),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Select(
                                    // hasValue: true,
                                    dropDownValue: controller.statusController.text,
                                    autoValidate: controller.dropdownAutoValidate.last,
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
                              Expanded(
                                child: Button(
                                  width: 120,
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
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                width: 700,
                                height: 230,
                                child: DefaultTabController(
                                  length: 4,
                                  child: Scaffold(
                                    appBar: PreferredSize(
                                      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height),
                                      child: Container(
                                        height: 50.0,
                                        child: const TabBar(
                                          labelColor: Colors.black,
                                          isScrollable: true,
                                          tabs: [
                                            Tab(text: "Equipamento / Acessórios"),
                                            Tab(text: "Principais Informações"),
                                            Tab(text: "Observação Geral"),
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
                                            padding: const EdgeInsets.only(top: 20),
                                            child: Expanded(
                                              child: Column(
                                                children: [
                                                  Row(children: [
                                                    Obx(() {
                                                      return Padding(
                                                        padding: const EdgeInsets.only(right: 10),
                                                        child: Select(
                                                            // hasValue: controller.moduloController.text == null ? false : true,
                                                            // dropDownValue: controller.moduloController.text == null ? "Módulo" : controller.moduloController.text,
                                                            // hasValue: controller.inputModuloValue.value == null ? false : true,
                                                            dropDownValue: controller.inputModuloValue.value == null ? "Módulo" : controller.inputModuloValue.value,
                                                            largura: 250,
                                                            label: "",
                                                            autoValidate: controller.dropdownAutoValidate.last,
                                                            onChanged: (value) {
                                                              controller.inputModuloValue.value = value!;
                                                              controller.onSelectDropDownModulo(value);
                                                            },
                                                            hintText: "Módulo",
                                                            dropDownItems: const [
                                                              "Seg-100",
                                                              "Seg-200",
                                                              "IC-100",
                                                              "IC-150",
                                                              "IC-150B",
                                                              "IC-150C",
                                                            ]),
                                                      );
                                                    }),
                                                    Obx((() => Padding(
                                                          padding: const EdgeInsets.only(right: 10),
                                                          child: controller.showModRastreador.value || controller.showModIC.value
                                                              ? InputText(
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
                                                                  width: 120,
                                                                  controller: controller.serieController)
                                                              : Container(),
                                                        ))),
                                                    Obx((() => Padding(
                                                          padding: const EdgeInsets.only(right: 15),
                                                          child: controller.showModRastreador.value
                                                              ? InputText(
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
                                                                  controller: controller.device_idController)
                                                              : Container(),
                                                        ))),
                                                    Obx((() => Padding(
                                                        padding: const EdgeInsets.only(right: 10),
                                                        child: controller.showModRastreador.value
                                                            ? Select(
                                                                // hasValue: true,
                                                                dropDownValue: controller.operadoraController.text,
                                                                largura: 180,
                                                                label: "",
                                                                onChanged: (value) {
                                                                  controller.operadoraController.text = value!;
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
                                                                  ])
                                                            : Container()))),
                                                  ]),
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(right: 10),
                                                        child: InputTextArea(label: 'Problema Informado', maxline: 5, width: 350, height: 160, controller: controller.problema_informadoController),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: InputTextArea(label: 'Problema Constatado', maxline: 5, width: 350, height: 160, controller: controller.problema_constatadoController),
                                                    ),
                                                  ],
                                                ),
                                                // Padding(
                                                //   padding: const EdgeInsets.only(
                                                //       top: 10),
                                                //   child: Row(children: [
                                                //     Expanded(
                                                //       child: InputTextArea(
                                                //           label:
                                                //               'Problema Constatado',
                                                //           maxline: 5,
                                                //           width: 700,
                                                //           height: 60,
                                                //           controller: controller
                                                //               .problema_constatadoController),
                                                //     ),
                                                //   ]),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: Expanded(
                                              child: InputTextArea(label: 'Observação Geral', maxline: 5, width: 700, height: 160, controller: controller.obs_geralController),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: Expanded(
                                              child: InputTextArea(label: 'Observação Técnica', maxline: 5, width: 700, height: 150, controller: controller.obs_tecnicaController),
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
                ),
              );
            } else {
              return Container(
                width: 700,
                height: Get.height * .62,
              );
            }
          }),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 20),
              child: buildAddButton(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 20),
              child: buildGravarButton(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, bottom: 20),
              child: ButtonCancelar(
                width: 120,
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
            ),
          ],
        ),
      ],
    );
  }

  Widget buildAddButton() {
    if (controller.idDados.isEmpty) {
      return Button(
        width: 120,
        text: "Adicionar",
        onTap: () {
          controller.dropdownAutoValidate.add(AutovalidateMode.always);
          if (formKey.currentState!.validate()) {
            controller.gravarDados(newData: true);
            controller.msgConfirmacao.value = "O.S adicionada com sucesso!";
            controller.limparCampos();
          } else {
            controller.msgConfirmacao.value = "Os campos destacados são obrigatórios!";
            controller.showMsgConfirmacao.value = true;
            controller.colorMensagem = 0xFFB94A48;
            controller.colorFundoMensagem = 0XFFFFCDD2;
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
        width: 120,
        text: "Gravar",
        onTap: () {
          if (formKey.currentState!.validate()) {
            controller.gravarDados(newData: false);
            controller.msgConfirmacao.value = "O.S editada com sucesso!";
            controller.colorMensagem = 0XFF3c763d;
            controller.colorFundoMensagem = 0XFFDFF0D8;
          } else {
            controller.msgConfirmacao.value = "Os campos destacados são obrigatórios!";
            controller.showMsgConfirmacao.value = true;
            controller.colorMensagem = 0xFFB94A48;
            controller.colorFundoMensagem = 0XFFFFCDD2;
          }
        },
      );
    } else {
      return Container();
    }
  }
}

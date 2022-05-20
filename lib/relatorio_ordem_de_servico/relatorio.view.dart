// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:os_interna/components/buttons.dart';
import 'package:os_interna/relatorio_ordem_de_servico/relatorio.controller.dart';
import 'package:os_interna/relatorio_usuarios/relatorio_usuario.view.dart';

import '../cadastro_ordem_servico/cadastro_ordem_servico.view.dart';
import '../login/login.view.dart';
import 'relatorio.model.dart';

class RelatorioView extends StatelessWidget {
  RelatorioController controller = RelatorioController();

  // // final controllerCadastrarDados = CadastrarDadosController(idDados: );

  // Widget montarBotaoDoMenu() {
  //   var teste = 1;

  //   if (AppController().user.role == "suporte") {
  //     return ListTile(
  //       title: const Text('Cadastro usuario'),
  //       onTap: () {
  //         Navigator.of(Get.context!).pop();
  //         showDialog(
  //           context: Get.context!,
  //           barrierDismissible: false,
  //           builder: (BuildContext context) => CadastrarUsuarioView(),
  //         );
  //       },
  //     );
  //   } else {
  //     return Container();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height / 100;
    double w = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          onPressed: () {
            Get.offAll(LoginView());
          },
          child: const Text(
            'Sair',
            style: TextStyle(color: Colors.white),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
      ]),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Button(
                    width: 120,
                    text: "Adicionar O.S",
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => CadastrarDadosView(
                                idDados: "",
                                atualizarRelatorio: controller.carregarRelatorio,
                              ));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: h * 80,
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    FutureBuilder(
                      future: controller.carregarRelatorio(),
                      builder: (context, snapshot) {
                        var point = "";

                        if (snapshot.hasData) {
                          //

                          return Obx(() {
                            RxList listaTabela = controller.listaTabela;

                            if (controller.listaTabela.isEmpty) {
                              return Container(
                                width: w * 100,
                                height: h * 85,
                                child: const Center(child: Text("Nenhuma ordem de serviço cadastrada")),
                              );
                            }

                            List<DataRow> linhas = [];

                            for (MovimentosDadosModel item in controller.listaTabela) {
                              linhas.add(
                                DataRow(
                                  cells: [
                                    DataCell(Text(item.idDados)),
                                    DataCell(Text(item.data_cadastro)),
                                    DataCell(Text(item.name)),
                                    DataCell(Text(item.modulo)),
                                    DataCell(Text(item.serie.toString())),
                                    DataCell(Text(item.device_id.toString())),
                                    DataCell(Text(item.status)),
                                    // DataCell(Text(item.obs_geral)),
                                    DataCell(
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            // barrierDismissible: false,
                                            builder: (BuildContext context) => CadastrarDadosView(
                                              idDados: item.idDados,
                                              atualizarRelatorio: controller.carregarRelatorio,
                                            ),
                                          );
                                        },
                                        child: Icon(Icons.edit),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            return Container(
                              width: w * 100,
                              child: DataTable(
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Nº O.S',
                                      style: TextStyle(
                                          // fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Data',
                                      style: TextStyle(
                                          // fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Cliente',
                                      style: TextStyle(
                                          // fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Módulo',
                                      style: TextStyle(
                                          // fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Série',
                                      style: TextStyle(
                                          // fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Device ID',
                                      style: TextStyle(
                                          // fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Status',
                                      style: TextStyle(
                                          // fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Editar',
                                      style: TextStyle(
                                          // fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                                rows: linhas,
                              ),
                            );
                          });

                          // return Container(
                          //   child: ListView.builder(
                          //     itemCount: controller.listaTabela.length,
                          //     itemBuilder: (context, index) {
                          //       return Container(
                          //         child: Text(
                          //           controller.listaTabela[index].name,
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // );
                        } else {
                          return const CircularProgressIndicator(
                            backgroundColor: Colors.blue,
                            color: Colors.white,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class FormPage extends StatelessWidget {
//   String idRegistro = "";

//   FormPage({
//     this.idRegistro = "",
//   }) {
//     var point = "";
//   }

//   TextEditingController controllerInputNome = TextEditingController();

//   Future initFormPage() async {
//     if (idRegistro != null) {
//       //1 consulta
//       // DatabaseReference database = FirebaseDatabase.instance.reference();

//       // final response = await database.child("dados/" + idRegistro).once();

//       //2 preencher campos

//       // controleInputNome.text = value;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

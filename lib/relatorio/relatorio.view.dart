// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:os_interna/app.controller.dart';
import 'package:os_interna/relatorio/relatorio.controller.dart';
import '../cadastro_ordem_servico/cadastro_ordem_servico.controller.dart';
import '../cadastro_ordem_servico/cadastro_ordem_servico.view.dart';
import '../login/login.view.dart';
import '../page/homepage.view.dart';
import 'relatorio.model.dart';

class RelatorioView extends StatelessWidget {
  RelatorioController controller = RelatorioController();

  // final controllerCadastrarDados = CadastrarDadosController(idDados: );

  // Widget montarBotaoDoMenu() {
  //   // var teste = 1;

  //   // if (AppController().user.role == "suporte") {
  //   //   return ListTile(
  //   //     title: const Text('Cadastro de ciente'),
  //   //     onTap: () {
  //   //       Navigator.of(context).pop();
  //   //       showDialog(
  //   //         context: context,
  //   //         barrierDismissible: false,
  //   //         builder: (BuildContext context) => FormModal(),
  //   //       );
  //   //     },
  //   //   );
  //   // } else {
  //   //   return Container();
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height / 100;
    double w = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('ORDEM DE SERVIÇO INTERNA'),
            ),
            // montarBotaoDoMenu(),
            ListTile(
              title: const Text('Ordem de Serviço'),
              onTap: () {
                Navigator.of(context).pop();
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) => CadastrarDadosView(
                          idDados: "",
                        ));
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                // Get.offAll(LoginView());
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: controller.carregarRelatorio(),
        builder: (context, snapshot) {
          var point = "";

          if (snapshot.hasData) {
            //

            List<DataRow> linhas = [];

            for (MovimentosDadosModel item in controller.listaTabela) {
              linhas.add(
                DataRow(
                  cells: [
                    DataCell(Text(item.name)),
                    DataCell(Text(item.modulo)),
                    DataCell(Text(item.serie.toString())),
                    DataCell(Text(item.device_id.toString())),
                    DataCell(Text(item.status)),
                    DataCell(
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            // barrierDismissible: false,
                            builder: (BuildContext context) =>
                                CadastrarDadosView(idDados: item.idDados),
                          );
                        },
                        child: Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
              child: Container(
                width: w * 100,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Cliente',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Módulo',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Série',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Device ID',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Status',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Editar',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                  rows: linhas,
                ),
              ),
            );

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


import 'package:flutter/material.dart';

import 'package:os_interna/components/buttons.dart';

import '../cadastro_usuarios/cadastro_usuario.controller.dart';
import '../cadastro_usuarios/cadastro_usuarios.view.dart';
import '../components/input_text.dart';

import 'relatorio_usuarios.controller.dart';
import 'relatorio_usuarios.model.dart';

class RelatorioUsuarioView extends StatelessWidget {
  RelatorioUsuarioView({
    Key? key,
    required this.idUsuario,
  }) : super(key: key) {
    controllerCadastrarUsuario = CadastrarUsuarioController(idUsuario: idUsuario);
    controllerRelatorioUsuarios = RelatorioUsuariosController();
  }

  String idUsuario;

  late CadastrarUsuarioController controllerCadastrarUsuario;
  late RelatorioUsuariosController controllerRelatorioUsuarios;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height / 100;
    double w = MediaQuery.of(context).size.width / 100;
    return
        // AlertDialog(
        //   title: Row(
        //     children: [
        //       Text("Cadastro - Usuário"),
        //     ],
        //   ),
        //   content:
        Container(
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
                  width: 50,
                  text: "Adicionar Usuário",
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => CadastrarUsuarioView(
                              idUsuario: '',
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
          Row(
            children: [
              Container(
                height: h * 80,
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      FutureBuilder(
                        future: controllerRelatorioUsuarios.carregarRelatorioUsuarios(),
                        builder: (context, snapshot) {
                          var point = "";
                          if (snapshot.hasData) {
                            if (controllerRelatorioUsuarios.listaTabelaUsuarios.isEmpty) {
                              return Container(
                                width: w * 100,
                                height: h * 80,
                                child: Center(child: Text("Nenhum usuario cadastrado")),
                              );
                            }

                            List<DataRow> linhas = [];

                            for (UsuariosModel item in controllerRelatorioUsuarios.listaTabelaUsuarios) {
                              linhas.add(
                                DataRow(
                                  cells: [
                                    DataCell(Text(item.username)),
                                    // DataCell(Text(item.senha.toString())),
                                    DataCell(
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.of(context).pop();
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) => CadastrarUsuarioView(idUsuario: item.idUsuario),
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
                              height: h * 80,
                              child: DataTable(
                                columns: const <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Usuário',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  // DataColumn(
                                  //   label: Text(
                                  //     'Senha',
                                  //     style: TextStyle(fontStyle: FontStyle.italic),
                                  //   ),
                                  // ),
                                  DataColumn(
                                    label: Text(
                                      'Editar',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ],
                                rows: linhas,
                              ),
                            );
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
        ],
      ),
    );
    //   actions: <Widget>[
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Button(
    //           text: "Adicionar novo Usuário",
    //           onTap: () {
    //             Navigator.of(context).pop();
    //             showDialog(
    //                 context: context,
    //                 // barrierDismissible: false,
    //                 builder: (BuildContext context) => CadastrarUsuarioView(
    //                       idUsuario: "",
    //                     ));
    //           },
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}

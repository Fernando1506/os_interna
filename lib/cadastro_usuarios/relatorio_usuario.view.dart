import 'package:flutter/material.dart';
import 'package:os_interna/cadastro_usuarios/relatorio_usuarios.controller.dart';
import 'package:os_interna/components/buttons.dart';

import '../components/input_text.dart';
import 'cadastro_usuario.controller.dart';
import 'cadastro_usuarios.view.dart';
import 'relatorio_usuarios.model.dart';

class RelatorioUsuarioView extends StatelessWidget {
  RelatorioUsuarioView({
    Key? key,
    required this.idDados,
  }) : super(key: key) {
    controller = CadastrarUsuarioController(idDados: idDados);
    controllerRelatorioUsuarios = RelatorioUsuariosController();
  }

  String idDados;

  late CadastrarUsuarioController controller;
  late RelatorioUsuariosController controllerRelatorioUsuarios;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Row(
          children: [
            Text("Cadastro - Usuário"),
          ],
        ),
        content: FutureBuilder(
          future: controllerRelatorioUsuarios.carregarRelatorioUsuarios(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DataRow> linhas = [];

              for (UsuariosModel item
                  in controllerRelatorioUsuarios.listaTabelaUsuarios) {
                linhas.add(
                  DataRow(
                    cells: [
                      DataCell(Text(item.username)),
                      DataCell(Text(item.senha.toString())),
                      DataCell(
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              // barrierDismissible: false,
                              builder: (BuildContext context) =>
                                  CadastrarUsuarioView(idDados: item.idDados),
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
                width: 500,
                height: 160,
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Usuário',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Senha',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Redefinir',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                    rows: linhas,
                  ),
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
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                text: "Adicionar",
                onTap: () {
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      // barrierDismissible: false,
                      builder: (BuildContext context) => CadastrarUsuarioView(
                            idDados: "",
                          ));
                },
              ),
            ],
          ),
        ]);
  }
}

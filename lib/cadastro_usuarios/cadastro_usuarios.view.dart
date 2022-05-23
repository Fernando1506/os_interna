import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:os_interna/components/buttons.dart';
import '../relatorio_usuarios/relatorio_usuarios.controller.dart';
import 'cadastro_usuario.controller.dart';

class CadastrarUsuarioView extends StatelessWidget {
  CadastrarUsuarioView({
    Key? key,
    required this.idUsuario,
  }) : super(key: key) {
    controller = CadastrarUsuarioController(idUsuario: idUsuario);
    controllerRelatorioUsuarios = RelatorioUsuariosController();
  }

  String idUsuario;

  late CadastrarUsuarioController controller;
  late RelatorioUsuariosController controllerRelatorioUsuarios;
  final formKey = GlobalKey<FormState>();
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text("Cadastro - Usuário"),
        ],
      ),
      content: FutureBuilder(
        future: controller.carregarUsuario(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: 300,
              height: 180,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Este campo é obrigatório!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Usuario',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            ),
                            controller: controller.usuarioController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Este campo é obrigatório!';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            ),
                            controller: controller.senhaController,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              width: 300,
              height: 180,
            );
          }
        },
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildAddButton(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: buildGravarButton(),
            ),
            Button(
              width: 20,
         
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
    if (controller.idUsuario.isEmpty) {
      return Button(
        width: 20,
    
        text: "Adicionar",
        onTap: () {
          if (formKey.currentState!.validate()) {
            controller.adicionarUsuario(newData: true);
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
    if (controller.idUsuario.isNotEmpty) {
      return Button(
        width: 120,
  
        text: "Gravar",
        onTap: () {
          if (formKey.currentState!.validate()) {
            controller.adicionarUsuario(newData: false);
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

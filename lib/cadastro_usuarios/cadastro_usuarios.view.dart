import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:os_interna/cadastro_usuarios/relatorio_usuarios.controller.dart';
import 'package:os_interna/components/buttons.dart';

import '../components/input_text.dart';
import 'cadastro_usuario.controller.dart';
import 'relatorio_usuarios.model.dart';

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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Row(
          children: [
            Text("Cadastro - Usuário"),
          ],
        ),
        content: Container(
          width: 300,
          height: 120,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Usuario',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      controller: controller.usuarioController,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      controller: controller.senhaController,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                text: "Adicionar",
                onTap: () {
                  controller.adicionarUsuario(newData: true);
                },
              ),
              Button(
                text: "Cancelar",
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        ]);
  }
}

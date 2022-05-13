import 'package:flutter/material.dart';
import 'package:os_interna/cadastro_ordem_servico/cadastro_ordem_servico.view.dart';

import '../login/login.view.dart';

import '../relatorio_ordem_de_servico/relatorio.view.dart';
import '../relatorio_usuarios/relatorio_usuario.view.dart';
import 'homepage.controller.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);

  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          onPressed: () {
            Get.offAll(LoginView());
          },
          child: Text(
            'Sair',
            style: TextStyle(color: Colors.white),
          ),
        )
      ]),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('ORDEM DE SERVIÇO INTERNA'),
            ),
            ListTile(
              title: const Text('Ordem de Serviço'),
              onTap: () {
                Get.back();
                controller.index.value = 1;
              },
            ),
            ListTile(
              title: const Text('Cadastro de Usuários'),
              onTap: () {
                Get.back();
                controller.index.value = 2;
              },
            ),
          ],
        ),
      ),
      body: Obx(() {
        switch (controller.index.value) {
          case 1:
            return RelatorioView();
          case 2:
            return RelatorioUsuarioView(
              idUsuario: "",
            );
          default:
            return Container(
              alignment: Alignment.center,
              child: Text('ORDEM DE SERVIÇO INTERNA',
                  style: TextStyle(fontSize: 20)),
            );
        }
      }),
    );
  }
}

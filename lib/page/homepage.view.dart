import 'package:flutter/material.dart';
import 'package:os_interna/formulario/cadastrar_dados.view.dart';

import '../login/login.view.dart';
import '../relatorio/relatorio.view.dart';
import 'homepage.controller.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);

  HomePageViewController controller = HomePageViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
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
              title: const Text('Relatório'),
              onTap: () {
                Get.offAll(RelatorioView());
              },
            ),
            ListTile(
              title: const Text('Cadastrar Cliente'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Cadastrar Instalador'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Impressão'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                // // Get.offAll(
                // //   LoginView(),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

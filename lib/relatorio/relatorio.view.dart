import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../formulario/cadastrar_dados.view.dart';
import '../login/login.view.dart';
import '../page/homepage.view.dart';

class RelatorioView extends StatelessWidget {
  const RelatorioView({Key? key}) : super(key: key);

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
              title: const Text('Ordem de Serviço'),
              onTap: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => FormModal(),
                );
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
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Role',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Sarah')),
                DataCell(Text('19')),
                DataCell(Text('Student')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:os_interna/components/buttons.dart';
import 'package:os_interna/components/input_text.dart';

class ColetaObjetosView extends StatelessWidget {
  const ColetaObjetosView({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text("Coleta"),
        ],
      ),
      content: Container(
        width: 150,
        height: 160,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InputText(label: "Origem", width: 150, controller: TextEditingController(), enabled: true, validator: (value) {}),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InputText(label: "Data Solicitação", width: 150, controller: TextEditingController(), enabled: true, validator: (value) {}),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InputText(label: "Código do Objeto", width: 150, controller: TextEditingController(), enabled: true, validator: (value) {}),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                  child: Button(
                width: 150,
                text: "Solicitar",
                onTap: () {},
              ))
            ],
          ),
        ),
      ],
    );
  }
}

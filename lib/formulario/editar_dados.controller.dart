import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:os_interna/relatorio/relatorio.model.dart';

class EditarDadosController {
  TextEditingController nomeController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  void initControllers(MovimentosDadosModel item) {
    nomeController.text = item.name;
    ageController.text = item.age.toString();
    roleController.text = item.role;
  }

  DatabaseReference ref = FirebaseDatabase.instance.reference();

  Future editarDados(MovimentosDadosModel item) async {
    await ref.child('dados').child('').update(
      {
        "name": nomeController.text,
        "age": ageController.text,
        "role": roleController.text,
      },
    );
  }
}

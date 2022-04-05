import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CadastrarDadosController {
  TextEditingController nomeController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  final databaseReference = FirebaseDatabase.instance.reference();

  Future gravarDados() async {
    var dataJson = {
      "nome": nomeController.text,
      "age": ageController.text,
      "rol": roleController.text,
    };

    firebaseInsertData(dataJson, "dados");
  }

  Future firebaseInsertData(var dataJson, String endPoint) async {
    String newKey = databaseReference.child(endPoint).push().key;

    var dataJson = {
      "id_dados": newKey,
      "nome": nomeController.text,
      "age": ageController.text,
      "rol": roleController.text,
    };

    databaseReference.child(endPoint).child(newKey).set(dataJson);
  }
}

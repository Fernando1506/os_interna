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

    databaseReference.child(endPoint).child(newKey).set(dataJson);
  }

  Future lerTodosValoresDeUmPath() async {
    DatabaseReference database = FirebaseDatabase.instance.reference();

    final response = await database.child("dados").once();

    response.value.forEach((key, values) {
      var chave = key;
      var valores = values;
      print(key);
      print(valores);
    });
  }
}

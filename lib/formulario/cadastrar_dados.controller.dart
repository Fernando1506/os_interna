import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../relatorio/relatorio.model.dart';
import 'cadastrar_dados.view.dart';

class CadastrarDadosController {
  TextEditingController nomeController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  CadastrarDadosController({
    this.idDados = "",
  });

  String idDados;

  //---------------------------------- ADICIONAR CADASTRO ---------------------------------------------------------

  final databaseReference = FirebaseDatabase.instance.reference();

  Future gravarDados({bool newData = true}) async {
    var dataJson = {
      "nome": nomeController.text,
      "age": ageController.text,
      "rol": roleController.text,
    };

    firebaseInsertData(dataJson, "dados", newData);
  }

  Future firebaseInsertData(var dataJson, String endPoint, bool newData) async {
    String newKey = databaseReference.child(endPoint).push().key;

    var dataJson = {
      "id_dados": newKey,
      "nome": nomeController.text,
      "age": ageController.text,
      "rol": roleController.text,
    };

    if (newData == true) {
      databaseReference.child(endPoint).child(newKey).set(dataJson);
    } else {
      databaseReference.child(endPoint).child(idDados).set(dataJson);
    }
  }

  //---------------------------------- EDITAR CADASTRO ---------------------------------------------------------

  Future carregarCadastro() async {
    if (idDados != null && idDados != "") {
      DatabaseReference database = FirebaseDatabase.instance.reference();
      final response = await database.child("dados/" + idDados).once();
      nomeController.text = response.value["nome"];
      ageController.text = response.value["age"].toString();
      roleController.text = response.value["rol"];
    }

    return true;
  }
}

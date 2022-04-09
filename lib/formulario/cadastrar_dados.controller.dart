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
    // String newKey = databaseReference.child(endPoint).push().key;

    //Primeiramente, é criado o dataJson sem idDados, e dependendo do tipo de operacao, o idDados sera adicionado no dataJson futuramente
    Map<String, dynamic> dataJson = {
      // "id_dados": newKey,
      "nome": nomeController.text,
      "age": ageController.text,
      "rol": roleController.text,
    };

    if (newData == true) {
      //
      //-------------- DADOS NOVOS -------------
      String newKey = databaseReference.child(endPoint).push().key; //// Gera o numero aleatorio que sera usado como id
      dataJson["id_dados"] = newKey; //// Adiciona o parametro "id_dados" dentro do dataJson que sera salvo no banco
      databaseReference.child(endPoint).child(newKey).set(dataJson); //// Salva os novos valores no banco
    } else {
      //
      //------------- ALTERAR DADOS ------------
      databaseReference.child(endPoint).child(idDados).update(dataJson); //// Mudou de "set" para "Update"
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

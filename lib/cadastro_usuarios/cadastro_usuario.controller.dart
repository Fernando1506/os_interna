import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CadastrarUsuarioController {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  CadastrarUsuarioController({
    this.idUsuario = "",
  });

  String idUsuario;

  //---------------------------------- ADICIONAR CADASTRO ---------------------------------------------------------

  final databaseReference = FirebaseDatabase.instance.reference();

  Future adicionarUsuario({bool newData = true}) async {
    var dataJson = {
      "username": usuarioController.text,
      "senha": senhaController.text,
    };

    firebaseInsertData(dataJson, "usuario", newData);
  }

  Future firebaseInsertData(var dataJson, String endPoint, bool newData) async {
    // String newKey = databaseReference.child(endPoint).push().key;

    //Primeiramente, é criado o dataJson sem idDados, e dependendo do tipo de operacao, o idDados sera adicionado no dataJson futuramente
    Map<String, dynamic> dataJson = {
      // "id_dados": newKey,

      "username": usuarioController.text,
      "senha": senhaController.text,
    };

    if (newData == true) {
      //********** TESTE ID AUTO INCREMENT **********/

      final response = await databaseReference.child("usuario").once();

      //
      //
      //-------------- DADOS NOVOS -------------
      String newKey = databaseReference.child(endPoint).push().key; //// Gera o numero aleatorio que sera usado como id
      dataJson["id_usuario"] = newKey; //// Adiciona o parametro "id_dados" dentro do dataJson que sera salvo no banco
      databaseReference.child(endPoint).child(newKey).set(dataJson); //// Salva os novos valores no banco
    } else {
      //
      //------------- ALTERAR DADOS ------------
      databaseReference.child(endPoint).child(idUsuario).update(dataJson); //// Mudou de "set" para "Update"
    }
  }

  //---------------------------------- EDITAR CADASTRO ---------------------------------------------------------

  Future carregarUsuario() async {
    if (idUsuario != null && idUsuario != "") {
      DatabaseReference database = FirebaseDatabase.instance.reference();
      final response = await database.child("usuario/" + idUsuario).once();
      usuarioController.text = response.value["username"];
      senhaController.text = response.value["senha"];
    }

    return true;
  }
}

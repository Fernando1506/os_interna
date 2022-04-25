import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../relatorio/relatorio.model.dart';

class CadastrarDadosController {
  TextEditingController nomeController = TextEditingController();
  TextEditingController moduloController = TextEditingController();
  TextEditingController serieController = TextEditingController();
  TextEditingController device_idController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController obs_geralController = TextEditingController();
  TextEditingController numeroOs = TextEditingController();

  CadastrarDadosController({
    this.idDados = "",
  });

  String idDados;

  //---------------------------------- ADICIONAR CADASTRO ---------------------------------------------------------

  final databaseReference = FirebaseDatabase.instance.reference();

  Future gravarDados({bool newData = true}) async {
    var dataJson = {
      "nome": nomeController.text,
      "modulo": moduloController.text,
      "serie": serieController.text,
      "device_id": device_idController.text,
      "status": statusController.text,
      "obs_geral": obs_geralController.text,
    };

    firebaseInsertData(dataJson, "dados", newData);
  }

  Future firebaseInsertData(var dataJson, String endPoint, bool newData) async {
    // String newKey = databaseReference.child(endPoint).push().key;

    //Primeiramente, é criado o dataJson sem idDados, e dependendo do tipo de operacao, o idDados sera adicionado no dataJson futuramente
    Map<String, dynamic> dataJson = {
      // "id_dados": newKey,

      "nome": nomeController.text,
      "modulo": moduloController.text,
      "serie": serieController.text,
      "device_id": device_idController.text,
      "status": statusController.text,
      "obs_geral": obs_geralController.text,
    };

    if (newData == true) {
      //
      //-------------- DADOS NOVOS -------------

      int newId = int.parse(numeroOs.text);

      dataJson["id_dados"] = newId; //// Adiciona o parametro "id_dados" dentro do dataJson que sera salvo no banco
      databaseReference.child(endPoint).child("-" + newId.toString()).set(dataJson); //// Salva os novos valores no banco
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
      moduloController.text = response.value["modulo"];
      serieController.text = response.value["serie"].toString();
      device_idController.text = response.value["device_id"].toString();
      statusController.text = response.value["status"];
      obs_geralController.text = response.value["obs_geral"];
    } else {
      //**************************/
      //    GERAR ID DA NOVA OS

      int newId = 0;

      var lastData = await databaseReference.child("dados").limitToFirst(1).once(); //// Resgata o ultimo registro da "tabela"

      if (lastData.value != null) {
        lastData.value.forEach((key, value) {
          var lastId = value["id_dados"];
          newId = lastId + 1; //// O id final será o o id do ultimo registro + 1;
        });
      }
      //**************************/

      numeroOs.text = newId.toString();
    }

    return true;
  }
}

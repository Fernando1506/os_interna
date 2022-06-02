import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastrarColetaController {
  TextEditingController dataSolicitacaoColeta = TextEditingController();
  TextEditingController origemColeta = TextEditingController();
  TextEditingController codigoObjeto = TextEditingController();
  TextEditingController statusController = TextEditingController();

  CadastrarColetaController({
    required this.idDados,
  });

  String idDados;

  //---------------------------------- ADICIONAR CADASTRO ---------------------------------------------------------

  final date = DateTime.now();
  final databaseReference = FirebaseDatabase.instance.reference();

  get ColetaObjetosView => null;

  Future gravarDados({bool newData = true}) async {
    var dataJson = {
      "data_solicitacao_coleta": dataSolicitacaoColeta.text,
      "origem_coleta": origemColeta.text,
      "codigo_objeto": codigoObjeto.text,
    };

    firebaseInsertData(dataJson, "dados", newData);
    // showMsgConfirmacao.value = true;
  }

  Future firebaseInsertData(var dataJson, String endPoint, bool newData) async {
    // String newKey = databaseReference.child(endPoint).push().key;

    //Primeiramente, é criado o dataJson sem idDados, e dependendo do tipo de operacao, o idDados sera adicionado no dataJson futuramente
    Map<String, dynamic> dataJson = {
      "data_solicitacao_coleta": dataSolicitacaoColeta.text,
      "origem_coleta": origemColeta.text,
      "codigo_objeto": codigoObjeto.text,
      "status": statusController.text = "Em Transito",
    };

    databaseReference.child(endPoint).child("-" + idDados).update(dataJson); //// Mudou de "set" para "Update"
  }

  // RxString statusProcesso = "".obs;
  // // RxBool trocarStatus = false.obs;

  // Future trocarStatusProcesso() async {
  //   if (codigoObjeto != null) {
  //     // trocarStatus.value = true;
  //     statusProcesso.value = "teste";
  //   }
  // }
}

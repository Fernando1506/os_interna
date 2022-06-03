import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastrarDadosController {
  TextEditingController numeroOs = TextEditingController();
  TextEditingController dataCadastroController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  // TextEditingController moduloController = TextEditingController();
  RxString inputModuloValue = "".obs;
  TextEditingController serieController = TextEditingController();
  TextEditingController device_idController = TextEditingController();
  // TextEditingController operadoraController = TextEditingController();
  RxString inputOperadoraValue = "".obs;
  TextEditingController placaController = TextEditingController();
  TextEditingController os_referenciaController = TextEditingController();
  // TextEditingController estoqueController = TextEditingController();
  RxString inputEstoqueValue = "".obs;
  TextEditingController statusController = TextEditingController(text: "Solicitar Coleta");
  TextEditingController problema_informadoController = TextEditingController();
  TextEditingController problema_constatadoController = TextEditingController();
  TextEditingController obs_geralController = TextEditingController();
  TextEditingController obs_tecnicaController = TextEditingController();

  RxList<AutovalidateMode> dropdownAutoValidate = [
    AutovalidateMode.disabled,
  ].obs;

  CadastrarDadosController({
    this.idDados = "",
  });

  String idDados;

  //---------------------------------- ADICIONAR CADASTRO ---------------------------------------------------------
  final date = DateTime.now();
  final databaseReference = FirebaseDatabase.instance.reference();

  get ColetaObjetosView => null;

  Future gravarDados({bool newData = true}) async {
    var dataJson = {
      "data_cadastro": dataCadastroController.text,
      "nome": nomeController.text,
      "modulo": inputModuloValue.value, // select
      "serie": serieController.text,
      "device_id": device_idController.text,
      "operadora": inputOperadoraValue.value, // select
      "placa": placaController,
      "os_referencia": os_referenciaController,
      "estoque": inputEstoqueValue.value, // select
      "status": statusController.text, // select
      "problema_informado": problema_informadoController,
      "problema_constatado": problema_constatadoController,
      "obs_geral": obs_geralController.text,
      "obs_tecnica": obs_tecnicaController,
    };

    firebaseInsertData(dataJson, "dados", newData);
  }

  Future firebaseInsertData(var dataJson, String endPoint, bool newData) async {
    // String newKey = databaseReference.child(endPoint).push().key;

    //Primeiramente, é criado o dataJson sem idDados, e dependendo do tipo de operacao, o idDados sera adicionado no dataJson futuramente
    Map<String, dynamic> dataJson = {
      "data_cadastro": dataCadastroController.text,
      "nome": nomeController.text,
      "modulo": inputModuloValue.value, // select
      "serie": serieController.text,
      "device_id": device_idController.text,
      "operadora": inputOperadoraValue.value, // select
      "placa": placaController.text,
      "os_referencia": os_referenciaController.text,
      "estoque": inputEstoqueValue.value, // select
      "status": statusController.text, // select
      "problema_informado": problema_informadoController.text,
      "problema_constatado": problema_constatadoController.text,
      "obs_geral": obs_geralController.text,
      "obs_tecnica": obs_tecnicaController.text,
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
      databaseReference.child(endPoint).child("-" + idDados).update(dataJson); //// Mudou de "set" para "Update"

    }
  }

  //---------------------------------- EDITAR CADASTRO ---------------------------------------------------------

  Future carregarCadastro() async {
    DateTime date = DateTime.now();

    String dia = date.day.toString();
    if (dia.length == 1) dia = "0" + dia;

    String mes = date.month.toString();
    if (mes.length == 1) mes = "0" + mes;

    dataCadastroController.text = dia + "/" + mes + "/" + date.year.toString();

    // dataCadastroController.text = date.day.toString() + "/" + date.month.toString() + "/" + date.year.toString();

    if (idDados != null && idDados != "") {
      DatabaseReference database = FirebaseDatabase.instance.reference();
      final response = await database.child("dados/-" + idDados).once();
      // numeroOs.text = response.value["numeroOs"];
      numeroOs.text = response.value["id_dados"].toString();
      dataCadastroController.text = response.value["data_cadastro"].toString();
      nomeController.text = response.value["nome"];
      inputModuloValue.value = response.value["modulo"];
      serieController.text = response.value["serie"];
      device_idController.text = response.value["device_id"].toString();
      inputOperadoraValue.value = response.value["operadora"];
      placaController.text = response.value["placa"];
      os_referenciaController.text = response.value["os_referencia"];
      inputEstoqueValue.value = response.value["estoque"];
      statusController.text = response.value["status"];
      problema_informadoController.text = response.value["problema_informado"];
      problema_constatadoController.text = response.value["problema_constatado"];
      obs_geralController.text = response.value["obs_geral"];
      obs_tecnicaController.text = response.value["obs_tecnica"];

      onSelectDropDownModulo(inputModuloValue.value);
    } else {
      //**************************/
      //    GERAR ID DA NOVA OS

      int newId = 2471;

      var lastData = await databaseReference.child("dados").limitToFirst(1).once(); //// Resgata o ultimo registro da "tabela"

      if (lastData.value != null) {
        lastData.value.forEach((key, value) {
          var lastId = value["id_dados"];
          newId = lastId + 1; //// O id final será o o id do ultimo registro + 1;
        });
      }

      idDados = newId.toString();
      //**************************/

      numeroOs.text = newId.toString();
    }

    return true;
  }

  RxBool showMsgConfirmacao = false.obs;
  RxString msgConfirmacao = "".obs;
  var colorMensagem = 0XFF3c763d;
  var colorFundoMensagem = 0XFFDFF0D8;

  //---------------------------------DROPDOWN---------------------------------
  RxBool showModRastreador = false.obs;
  RxBool showModIC = false.obs;

  Future onSelectDropDownModulo(String valor) async {
    if (valor == "Seg-100" || valor == "Seg-200") {
      showModRastreador.value = true;
      showModIC.value = false;
    }
    if (valor == "IC-100" || valor == "IC-150" || valor == "IC-150B" || valor == "IC-150C") {
      showModIC.value = true;
      showModRastreador.value = false;
    }
  }

//---------------------------------- LIMPAR CAMPOS ---------------------------------------------------------

  void limparCampos() {
    nomeController.clear();
    // moduloController.clear();
    inputModuloValue.value = "";
    serieController.clear();
    device_idController.clear();
    inputOperadoraValue.value = "";
    placaController.clear();
    os_referenciaController.clear();
    inputEstoqueValue.value = "";
    statusController.clear();
    problema_informadoController.clear();
    problema_constatadoController.clear();
    obs_geralController.clear();
    obs_tecnicaController.clear();
  }
}

// Future<String> tratarData(DateTime date) async {
//   DateTime date = DateTime.now();

//   String dia = date.day.toString();
//   if (dia.length == 1) dia = "0" + dia;

//   String mes = date.month.toString();
//   if (mes.length == 1) mes = "0" + mes;

//   String dataFinal = dia + "/" + mes + "/" + date.year.toString();

//   return dataFinal;
// }

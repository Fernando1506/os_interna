import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:os_interna/app.controller.dart';

import 'relatorio.model.dart';

class RelatorioController {
  RxList listaTabela = <MovimentosDadosModel>[].obs;

  Future metodoTeste() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    return "";
  }

  Future refreshRelatorio() async {
    //
  }

  Future carregarRelatorio() async {
    listaTabela.clear();

    DatabaseReference database = FirebaseDatabase.instance.reference();

    final response = await database.child("dados").once();

    if (response.value != null) {
      response.value.forEach((key, values) {
        listaTabela.add(
          MovimentosDadosModel(
            // numeroOs: values["numeroOs"],
            idDados: values["id_dados"].toString(),
            data_cadastro: values["data_cadastro"].toString(),
            name: values["nome"],
            modulo: values["modulo"],
            serie: values["serie"],
            device_id: int.parse(values["device_id"]),
            operadora: values["operadora"],
            placa: values["placa"],
            os_referencia: values["os_referencia"],
            estoque: values["estoque"],
            status: values["status"],
            problema_informado: values["problema_informado"],
            problema_constatado: values["problema_constatado"],
            obs_geral: values["obs_geral"],
            obs_tecnica: values["obs_tecnica"],
          ),
        );
      });
      var p = "";
    } else {
      listaTabela.value = [];
    }

    return true;
  }
}

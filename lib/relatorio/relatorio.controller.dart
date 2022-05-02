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
            serie: int.parse(values["serie"]),
            device_id: int.parse(values["device_id"]),
            name: values["nome"],
            status: values["status"],
            modulo: values["modulo"],
            obs_geral: values["obs_geral"],
          ),
        );
      });
    } else {
      listaTabela.value = [];
    }

    return true;
  }
}

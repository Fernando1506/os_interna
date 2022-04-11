import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:os_interna/app.controller.dart';

import 'relatorio.model.dart';

class RelatorioController {
  final listaTabela = <MovimentosDadosModel>[].obs;

  Future metodoTeste() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    return "";
  }

  Future refreshRelatorio() async {
    //
  }

  Future carregarRelatorio() async {
    DatabaseReference database = FirebaseDatabase.instance.reference();

    final response = await database.child("dados").once();

    response.value.forEach((key, values) {
      listaTabela.add(
        MovimentosDadosModel(
          idDados: values["id_dados"],
          serie: int.parse(values["serie"]),
          device_id: int.parse(values["device_id"]),
          name: values["nome"],
          status: values["status"],
          modulo: values["modulo"],
        ),
      );
    });

    var point = "";

    return true;
  }
}

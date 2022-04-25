import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:os_interna/app.controller.dart';

import 'relatorio.model.dart';

class RelatorioController {
  var listaTabela = <MovimentosDadosModel>[].obs;

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

    if (response.value != null) {
      for (var registro in response.value) {
        var teste = registro;

        listaTabela.add(
          MovimentosDadosModel(
            idDados: registro["id_dados"].toString(),
            serie: int.parse(registro["serie"]),
            device_id: int.parse(registro["device_id"]),
            name: registro["nome"],
            status: registro["status"],
            modulo: registro["modulo"],
            obs_geral: registro["obs_geral"],
          ),
        );
      }

      // response.value.forEach((key, values) {
      //   var point = "";
      //   listaTabela.add(
      //     MovimentosDadosModel(
      //       idDados: values["id_dados"],
      //       serie: int.parse(values["serie"]),
      //       device_id: int.parse(values["device_id"]),
      //       name: values["nome"],
      //       status: values["status"],
      //       modulo: values["modulo"],
      //       obs_geral: values["obs_geral"],
      //     ),
      //   );
      // });
    } else {
      listaTabela.value = [];
    }

    var point = "";

    return true;
  }
}

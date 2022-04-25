import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'relatorio_usuarios.model.dart';

class RelatorioUsuariosController {
  final listaTabelaUsuarios = <UsuariosModel>[].obs;

  Future metodoTeste() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    return "";
  }

  Future refreshRelatorio() async {
    //
  }

  Future carregarRelatorioUsuarios() async {
    DatabaseReference database = FirebaseDatabase.instance.reference();

    //************** TESTE ***************/

    final teste1 = await database.child("usuario").limitToLast(1).once();

    //**********************************/

    final response = await database.child("usuario").once();

    response.value.forEach((key, values) {
      listaTabelaUsuarios.add(
        UsuariosModel(
          idUsuario: values["id_usuario"],
          username: values["username"],
          senha: int.parse(values["senha"]),
        ),
      );
    });

    var point = "";

    return true;
  }
}

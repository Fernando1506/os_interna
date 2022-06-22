import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../relatorio_ordem_de_servico/relatorio.view.dart';

class LoginController {
  TextEditingController usuario = TextEditingController();
  TextEditingController senha = TextEditingController();

  Future logarSistema() async {
    if (usuario.text == "admin" && senha.text == "123") {
      Get.off(RelatorioView());
    } else {
      Container();
    }
  }
}

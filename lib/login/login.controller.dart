import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:os_interna/app.controller.dart';

import '../auth/models/user.model.dart';

class LoginController {
  //

  TextEditingController userInput = TextEditingController();
  TextEditingController passInput = TextEditingController();

  //----------------- TENTAR AUTENTICAR -----------------

  Future tryAuth() async {
    String user = userInput.text;
    String pass = passInput.text;

    DatabaseReference database = FirebaseDatabase.instance.reference();

    Query query = database.child("/usuarios").orderByChild("usuario_id").endAt(1);
    DataSnapshot response = await query.once();

    Map userData = response.value.values.first;

    if (userData["pass"].toString() == pass) {
      loginSuccess(userData);
    } else {
      loginError();
    }

    var p = "";
  }

  //---------------------- SUCESSO ----------------------

  Future loginSuccess(Map userData) async {
    AppController.instance.authSession.autenticarUsuario(
      User(
        nome: userData["nome"],
        role: await _determinarRole(userData["role"]),
      ),
    );
    print("SUCESSO!!!!!!!!!!!!!!");
  }

  Future<UserRole> _determinarRole(String dbRole) async {
    if (dbRole == UserRole.fiscalFinanceiro) return UserRole.fiscalFinanceiro;
    if (dbRole == UserRole.suporte) return UserRole.suporte;

    return UserRole.suporte;
  }

  //----------------------- ERRO ------------------------

  Future loginError() async {
    print("ERRO!!!!!!!!!!!!!!");
  }
}
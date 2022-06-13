import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LoginController {
  //

  TextEditingController userInput = TextEditingController();
  TextEditingController passInput = TextEditingController();

  Future tryAuth() async {
    String user = userInput.text;
    String pass = passInput.text;

    DatabaseReference database = FirebaseDatabase.instance.reference();

    Query query = database.child("/usuarios").orderByChild("usuario_id").startAt(1).endAt(2);

    DataSnapshot event = await query.once();

    var p = "";
  }
}

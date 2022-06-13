//===================================================== AUTH SESSION =====================================================

import 'models/user.model.dart';

class AuthSession {
  late User user;

  //------------------------ AUTENTICAR USUARIO ------------------------

  Future autenticarUsuario(User userData) async {
    user = userData;
  }

  Future determinarRole() async {
    //
  }

  //------------------------- RECUPERAR SESSAO -------------------------

  Future recuperarSessao() async {
    //
  }

  //------------------------ DESCONECTAR USUARIO ------------------------

  Future desconectarUsuario() async {
    //
  }
}

//===================================================== AUTH SESSION =====================================================

import 'models/user.model.dart';

class AuthSession {
  User user = User(
    nome: "Fernando",
    role: UserRole.suporte,
  );

  //------------------------ AUTENTICAR USUARIO ------------------------

  Future autenticarUsuario(User userData) async {
    //
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

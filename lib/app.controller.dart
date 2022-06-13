//==================================================== APP CONTROLLER =====================================================

import 'auth/auth_session.dart';
import 'auth/models/user.model.dart';

class AppController {
  late AuthSession authSession;

  User user = User(
    nome: "Fernando",
    role: UserRole.suporte,
  );

  static final AppController instance = AppController._();

  AppController._() {}
}


// class User {
//   String nome = "fernando";
//   String role = "suporte";
// }

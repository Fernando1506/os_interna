import 'dart:ffi';

class MovimentosDadosModel {
  String name;
  Int age;
  String role;

  MovimentosDadosModel({
    required this.name,
    required this.age,
    required this.role,
  });

  List<MovimentosDadosModel> userList = [];
}

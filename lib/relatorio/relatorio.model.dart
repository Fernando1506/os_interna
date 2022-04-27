// import 'dart:ffi';

class MovimentosDadosModel {
  // String numeroOs; *** NAO TEM QUE TER ESSE CAMPO, O PROPRIO ID JA EH O NUMERO DA OS
  String idDados;
  String name;
  String modulo;
  int serie;
  int device_id;
  String status;
  String obs_geral;

  MovimentosDadosModel({
    // required this.numeroOs,
    required this.idDados,
    required this.name,
    required this.modulo,
    required this.serie,
    required this.device_id,
    required this.status,
    required this.obs_geral,
  });
}

// import 'dart:ffi';

class MovimentosDadosModel {
  // String numeroOs; *** NAO TEM QUE TER ESSE CAMPO, O PROPRIO ID JA EH O NUMERO DA OS
  String idDados;
  String name;
  String data_cadastro;
  String modulo;
  String serie;
  int device_id;
  String operadora;
  String placa;
  String os_referencia;
  String estoque;
  String status;
  String problema_informado;
  String problema_constatado;
  String obs_geral;
  String obs_tecnica;

  // DADOS COLETA
  // String data_solicitacao_coleta;
  // String origem_coleta;
  // String codigo_objeto;

  MovimentosDadosModel({
    // required this.numeroOs,
    required this.idDados,
    required this.data_cadastro,
    required this.name,
    required this.modulo,
    required this.serie,
    required this.device_id,
    required this.operadora,
    required this.placa,
    required this.os_referencia,
    required this.estoque,
    required this.status,
    required this.problema_informado,
    required this.problema_constatado,
    required this.obs_geral,
    required this.obs_tecnica,

    // DADOS COLETA
    // required this.data_solicitacao_coleta,
    // required this.origem_coleta,
    // required this.codigo_objeto,
  });
}

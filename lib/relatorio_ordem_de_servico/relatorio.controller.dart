import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:os_interna/app.controller.dart';

import '../auth/models/user.model.dart';
import '../cadastro_ordem_servico/cadastro_ordem_servico.view.dart';
import 'mount_report_elements.dart';
import 'relatorio.model.dart';
import 'widgets/report_table/report_table.controller.dart';

class RelatorioController {
  RxList listaTabela = <MovimentosDadosModel>[].obs;

  RxList<ReportSource> reportSource = <ReportSource>[].obs;

  Future metodoTeste() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    return "";
  }

  Future refreshRelatorio() async {
    //
  }

  //------------------------------- CARREGAR RELATORIO -------------------------------

  Future carregarRelatorio() async {
    listaTabela.clear();

    List<MovimentosDadosModel> dados = await carregarDados();

    listaTabela.value = dados;

    List<DataRow> linhas = await montarLinhasDoRelatorio(dados);

    List<DataColumn> colunas = await montarColunasDoRelatorio();

    reportSource.add(
      ReportSource(
        rows: linhas,
        columns: colunas,
      ),
    );

    return true;
  }

  //--------------------------------- CARREGAR DADOS ---------------------------------

  Future<List<MovimentosDadosModel>> carregarDados() async {
    DatabaseReference database = FirebaseDatabase.instance.reference();

    UserRole userRole = AppController.instance.authSession.user.role;

    Query query = await database.child("dados");

    // //----- SE FOR SUPORTE -----
    // if (userRole == UserRole.suporte) {
    //   query = query.orderByChild('status').equalTo('Solicitar Coleta');
    // }

    final response = await query.once();

    List<MovimentosDadosModel> returnList = [];

    if (response.value != null) {
      response.value.forEach((key, values) {
        bool addItem = false;

        //-------- SE FOR SUPORTE --------
        if (userRole == UserRole.suporte) {
          if (values["status"] == 'Solicitar Coleta') {
            addItem = true;
          } else if (values["status"] == 'Em Transito') {
            addItem = true;
          }
        }

        //--- SE FOR FINANCEIRO/FISCAL ---
        if (userRole == UserRole.fiscalFinanceiro) {
          if (values["status"] == 'Em Transito') {
            addItem = true;
          }
        }

        if (addItem == true) {
          returnList.add(
            MovimentosDadosModel(
              // numeroOs: values["numeroOs"],
              idDados: values["id_dados"].toString(),
              data_cadastro: values["data_cadastro"].toString(),
              name: values["nome"],
              modulo: values["modulo"],
              serie: values["serie"],
              device_id: int.parse(values["device_id"]),
              operadora: values["operadora"],
              placa: values["placa"],
              os_referencia: values["os_referencia"],
              estoque: values["estoque"],
              status: values["status"],
              problema_informado: values["problema_informado"],
              problema_constatado: values["problema_constatado"],
              obs_geral: values["obs_geral"],
              obs_tecnica: values["obs_tecnica"],
            ),
          );
        }
      });
      var p = "";
    } else {
      returnList = [];
    }

    return returnList;
  }

  //--------------------------------- MONTAR COLUNAS ---------------------------------

  Future<List<DataColumn>> montarColunasDoRelatorio() async {
    List<DataColumn> columns = [
      DataColumn(
        label: Text(
          'Nº O.S',
          style: TextStyle(
              // fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          'Data',
          style: TextStyle(
              // fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          'Cliente',
          style: TextStyle(
              // fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          'Módulo',
          style: TextStyle(
              // fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          'Série',
          style: TextStyle(
              // fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          'Device ID',
          style: TextStyle(
              // fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          'Status',
          style: TextStyle(
              // fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          'Editar',
          style: TextStyle(
              // fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
    ];

    columns = await MountReportElements().mountElementsInColumnList(columns);

    return columns;
  }

  //--------------------------------- MONTAR LINHAS ---------------------------------

  Future<List<DataRow>> montarLinhasDoRelatorio(List<MovimentosDadosModel> movimentos) async {
    List<DataRow> linhas = [];

    for (MovimentosDadosModel item in movimentos) {
      //

      List<DataCell> cells = [];

      cells.add(DataCell(Text(item.idDados)));
      cells.add(DataCell(Text(item.data_cadastro)));
      cells.add(DataCell(Text(item.name)));
      cells.add(DataCell(Text(item.modulo)));
      cells.add(DataCell(Text(item.serie.toString())));
      cells.add(DataCell(Text(item.device_id.toString())));
      cells.add(DataCell(Text(item.status)));
      cells.add(
        DataCell(
          GestureDetector(
            onTap: () {
              showDialog(
                context: Get.context!,
                // barrierDismissible: false,
                builder: (BuildContext context) => CadastrarOrdemServicoView(
                  idDados: item.idDados,
                  atualizarRelatorio: carregarRelatorio,
                ),
              );
            },
            child: Icon(Icons.edit),
          ),
        ),
      );

      DataRow finalRow = DataRow(
        cells: cells,
      );

      finalRow = await MountReportElements().mountElementInRow(finalRow, item);

      linhas.add(
        DataRow(
          cells: cells,
        ),
      );
    }

    return linhas;
  }
}

//==========================================================================================================================================================================================================================================
//==========================================================================================================================================================================================================================================
//==========================================================================================================================================================================================================================================
//                                                                                                   MOUNT REPORT ELEMENTS

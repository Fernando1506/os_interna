import 'package:flutter/material.dart';
import 'package:os_interna/app.controller.dart';

import '../auth/models/user.model.dart';
import 'relatorio.model.dart';

class MountReportElements {
  List<ReportElement> elements = [];

  MountReportElements() {
    defineElements();
  }

  //====================================================== DEFINIR ELEMENTOS ======================================================

  defineElements() {
    // //
    UserRole userRole = AppController.instance.authSession.user.role;

    // //----------------- BOTAO SOLICITAR COLETA -----------------
    elements.add(
      ReportElement(
        rowWidget: Container(
          child: Text("TESTANDO!!!"),
        ),
        displayCondition: () async {
          if (userRole != UserRole.suporte) {
            return true;
          } else {
            return false;
          }
        },
      ),
    );

    // //----------------- BOTAO VALIDAR RECEBIMENTO -----------------

    // elements.add(
    //   ReportElement(
    //     rowWidget: Container(
    //       child: Text("TESTANDO2!!!"),
    //     ),
    //     displayCondition: () async {
    //       if (userRole != UserRole.suporte) {
    //         return true;
    //       } else {
    //         return false;
    //       }
    //     },
    //   ),
    // );
  }

  //============================================= RODAR MONTAGEM DE ELEMENTOS NA LINHA =============================================

  Future<DataRow> mountElementInRow(DataRow row, MovimentosDadosModel rowData) async {
    DataRow finalRow = row;
    for (ReportElement element in elements) {
      finalRow = await element.insertElementInRow(finalRow, rowData);
    }
    var p = "";
    return finalRow;
  }

  //======================================= RODAR MONTAGEM DE ELEMENTOS NA LISTA DE COLUNAS =======================================

  Future<List<DataColumn>> mountElementsInColumnList(List<DataColumn> columns) async {
    List<DataColumn> finalColumns = columns;
    for (ReportElement element in elements) {
      columns = await element.insertElementInColumns(columns);
    }
    var p = "";
    return finalColumns;
  }
}

class ReportElement {
  //
  final Widget rowWidget;

  Widget? columnWidget;

  //-------------- INSERIR ELEMENTO NA LINHA --------------

  Future insertElementInRow(DataRow row, MovimentosDadosModel rowData) async {
    if (await displayCondition()) {
      //se a condicao for aprovada
      row.cells.add(
        DataCell(
          rowWidget,
        ),
      );
      return row;
    } else {
      return row;
    }
  }

  //-------- INSERIR ELEMENTO NAS COLUNAS DO HEADER --------

  Future insertElementInColumns(List<DataColumn> columns) async {
    if (await displayCondition()) {
      //se a condicao for aprovada
      columns.add(
        DataColumn(
          label: columnWidget!,
        ),
      );
      return columns;
    } else {
      return columns;
    }
  }

  Future<bool> Function() displayCondition;

  ReportElement({
    required this.displayCondition,
    required this.rowWidget,
    this.columnWidget,
  }) {
    if (columnWidget == null) columnWidget = Container();
  }
}

// class TesteReportElementV2 {
//   UserRole userRole = UserRole.desenvolvedor;
//   var teste = ReportElement(
//     rowWidget: Container(),
//     displayCondition: () async {
//       if (userRole != UserRole.suporte) {
//         return true;
//       } else {
//         return false;
//       }
//     },
//   );
// }

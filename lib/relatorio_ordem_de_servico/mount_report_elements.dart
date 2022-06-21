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
    //
    UserRole userRole = AppController.instance.authSession.user.role;

    elements.add(
      //----------------- BOTAO SOLICITAR COLETA -----------------
      ReportElement(
        insertElementInRow: (DataRow row, MovimentosDadosModel rowData) async {
          if (userRole != UserRole.suporte) return row;
          row.cells.add(
            DataCell(
              Container(
                child: Text("TESTANDO!!!"),
              ),
            ),
          );
          return row;
        },
        insertElementInColumns: (List<DataColumn> columns) async {
          if (userRole != UserRole.suporte) return columns;
          columns.add(
            DataColumn(
              label: Text(""),
            ),
          );
          return columns;
        },
      ),
      //
      //----------------- BOTAO VALIDAR RECEBIMENTO -----------------
    );
  }

  //============================================= RODAR MONTAGEM DE ELEMENTOS NA LINHA =============================================

  Future<DataRow> mountElementInRow(DataRow row, MovimentosDadosModel rowData) async {
    DataRow finalRow = row;
    for (ReportElement element in elements) {
      finalRow = await element.insertElementInRow(finalRow, rowData);
    }
    return finalRow;
  }

  //======================================= RODAR MONTAGEM DE ELEMENTOS NA LISTA DE COLUNAS =======================================

  Future<List<DataColumn>> mountElementsInColumnList(List<DataColumn> columns) async {
    List<DataColumn> finalColumns = columns;
    for (ReportElement element in elements) {
      columns = await element.insertElementInColumns(columns);
    }
    return finalColumns;
  }
}

//MODEL
class ReportElement {
  //
  Future<DataRow> Function(DataRow row, MovimentosDadosModel rowData) insertElementInRow;
  Future<List<DataColumn>> Function(List<DataColumn> columns) insertElementInColumns;

  ReportElement({
    required this.insertElementInRow,
    required this.insertElementInColumns,
  });
}

//===================== V2 =====================
//==============================================

class ReportElementV2 {
  //
  // Future<DataRow> Function(DataRow row, MovimentosDadosModel rowData) insertElementInRow;
  // Future<List<DataColumn>> Function(List<DataColumn> columns) insertElementInColumns;

  //--------

  Future insertElementInRow(DataRow row, MovimentosDadosModel rowData) async {
    //
  }

  Future insertElementInColumns(List<DataColumn> columns) async {
    //
  }

  Future Function() displayCondition;

  ReportElementV2({
    required this.displayCondition,
  });

  // ReportElementV2({
  //   required this.insertElementInRow,
  //   required this.insertElementInColumns,
  // });
}

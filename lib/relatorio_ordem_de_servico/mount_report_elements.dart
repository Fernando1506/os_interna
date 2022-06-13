import 'package:flutter/material.dart';

import 'relatorio.model.dart';

class MountReportElements {
  List<ReportElement> elements = [];

  MountReportElements() {
    defineElements();
  }

  //====================================================== DEFINIR ELEMENTOS ======================================================

  defineElements() {
    //
    //========== BOTAO SOLICITAR COLETA ==========
    elements.add(
      ReportElement(
        insertElementInRow: (DataRow row, MovimentosDadosModel rowData) async {
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
          columns.add(
            DataColumn(
              label: Text(""),
            ),
          );
          return columns;
        },
      ),
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

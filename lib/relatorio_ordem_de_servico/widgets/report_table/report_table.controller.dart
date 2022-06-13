import 'package:flutter/material.dart';

class ReportSource {
  List<DataRow> rows;
  List<DataColumn> columns;
  ReportSource({
    required this.rows,
    required this.columns,
  });
}

class ReportTableController {
  //

  Future initialize() async {
    await mountRows();
    await mountColumns();
  }

  Future mountRows() async {
    //
  }

  Future mountColumns() async {
    //
  }
}

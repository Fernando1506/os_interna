import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'report_table.controller.dart';

class ReportTable extends StatelessWidget {
  // List<ReportItem> baseList = [];

  ReportSource source;

  ReportTable({
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height / 100;
    double w = MediaQuery.of(context).size.width / 100;

    return Container(
      width: w * 100,
      child: DataTable(
        columns: source.columns,
        rows: source.rows,
      ),
    );
  }
}

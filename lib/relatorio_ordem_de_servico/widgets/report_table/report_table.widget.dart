import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReportItem {
  var row;
  var column;
}

class ReportTable extends StatelessWidget {
  List<ReportItem> baseList = [];

  ReportTable({
    required this.baseList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReportRowDefinition {
  List<ReportSourceValue> values;
  ReportRowDefinition({
    required this.values,
  });
}

class ReportSourceValue {
  String key = "";
  String value = "";
  ReportSourceValue({
    required this.key,
    required this.value,
  });
}

class ReportTable extends StatelessWidget {
  // List<List<Map>> dataSource = [
  //   [
  //     {"nome": "marcos"},
  //     {"email": "marcos@email.com"},
  //   ],
  // ];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

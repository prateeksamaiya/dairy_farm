import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'components/my_scaffold.dart';
import 'components/dataTable.dart';
import 'package:dairy_farm/application/milking_data.dart';


class HomeScreen extends StatelessWidget {
  static const String id = "home";
  @override
  Widget build(BuildContext context) {
    return MyScaffold(body: Consumer(
      builder: (context, watch, child) {
        final dailyMilkingNumber = watch(milkingDataProvider).totalCounts();
        return MyDataTable(
          rowData: dailyMilkingNumber,
        );
      },
    ));
  }
}

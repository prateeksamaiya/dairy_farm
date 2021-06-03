import 'package:dairy_farm/application/notifier/milking_data.dart';
import 'package:dairy_farm/components/milkingDataTable.dart';
import 'package:dairy_farm/components/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider.dart';

class MilkingListScreen extends StatelessWidget {
  static const String id = "milking_data_screen";
  final List<String> columnHeaders = ["milker", "cattleType", "cattleNumber", "milkQuantity"];
  final String tableHeading = "Today's Report";


  @override
  Widget build(BuildContext context) {
    print("building HomeScreen");
    return MyScaffold(Consumer(builder: (context, watch, child) {
      final milkEntries = watch(milkingDataProvider.state);
      print("building consumer homeScreen");
      return milkEntries.when(
          data: (milkingEntries) =>
              MyDataTable(rowData: milkingEntries, columnHeaders: columnHeaders, tableHeading: tableHeading),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, s) => Text(e.toString()));
    }));
  }
}

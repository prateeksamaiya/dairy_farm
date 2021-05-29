import 'package:dairy_farm/components/aggreagatedDataTable.dart';
import 'package:dairy_farm/components/my_scaffold.dart';
import 'package:dairy_farm/enums/cattle_type.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application_constants.dart';
import '../provider.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "home";
  final List<String> columnHeaders = ["Cattle Type", "Quantity (L)"];
  final String tableHeading = "Today's Report";

  totalCounts(List<MilkingEntry> milkingEntries) {
    double cowTotalMilk = 0;
    double buffaloTotalMilk = 0;
    double totalMilk = 0;
    int cow_count = 0;
    int buffalo_count = 0;

    for (MilkingEntry entry in milkingEntries) {
      if (entry.cattleType == CattleType.Buffalo.toShortString()) {
        buffaloTotalMilk += entry.milkQuantity;
        buffalo_count++;
      }

      if (entry.cattleType == CattleType.Cow.toShortString()) {
        cowTotalMilk += entry.milkQuantity;
        cow_count++;
      }
      totalMilk += entry.milkQuantity;
    }
    return {
      CattleType.Cow.toShortString() + " (" + cow_count.toString() + ")": cowTotalMilk.toString(),
      CattleType.Buffalo.toShortString() + " (" + buffalo_count.toString() + ")": buffaloTotalMilk.toString(),
      kTotal: totalMilk.toString(),
    };
  }

  @override
  Widget build(BuildContext context) {
    print("building HomeScreen");
    return MyScaffold(Consumer(builder: (context, watch, child) {
      final milkEntries = watch(milkingDataProvider.state);
      print("building consumer homeScreen");
      return milkEntries.when(
          data: (milkingEntries) => AggregateDataTable(
              rowData: totalCounts(milkingEntries), columnHeaders: columnHeaders, tableHeading: tableHeading),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, s) => Text(e.toString()));
    }), () => {context.read(milkingDataProvider).reload()});
  }
}

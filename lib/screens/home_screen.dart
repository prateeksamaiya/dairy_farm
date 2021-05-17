import 'package:dairy_farm/components/dataTable.dart';
import 'package:dairy_farm/components/my_scaffold.dart';
import 'package:dairy_farm/enums/cattle_type.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application_constants.dart';
import '../provider.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "home";

  totalCounts(List<MilkingEntry> entries) {
    double cowTotalMilk = 0;
    double buffaloTotalMilk = 0;
    double totalMilk = 0;

    for (MilkingEntry entry in entries) {
      if (entry.cattleType == CattleType.Buffalo.toShortString()) {
        buffaloTotalMilk += entry.milkQuantity;
      }

      if (entry.cattleType == CattleType.Cow.toShortString()) {
        cowTotalMilk += entry.milkQuantity;
      }
      totalMilk += entry.milkQuantity;
    }
    return {
      CattleType.Cow.toShortString(): cowTotalMilk.toString(),
      CattleType.Buffalo.toShortString(): buffaloTotalMilk.toString(),
      kTotal: totalMilk.toString(),
    };
  }

  @override
  Widget build(BuildContext context) {
    print("building HomeScreen");
    return MyScaffold(body: Consumer(builder: (context, watch, child) {
      final milkEntries = watch(milkingDataProvider.state);
      print("building consumer homeScreen");
      return milkEntries.when(
          data: (milkingEntries) => MyDataTable(rowData: totalCounts(milkingEntries)),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, s) => Text(e.toString()));
    }));
  }
}

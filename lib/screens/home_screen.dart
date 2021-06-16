import 'package:dairy_farm/application/notifier/milking_data_notifier.dart';
import 'package:dairy_farm/components/aggreagatedDataTable.dart';
import 'package:dairy_farm/components/my_scaffold.dart';
import 'package:dairy_farm/enums/cattle_type.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:dairy_farm/util/applicaition_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_localizations.dart';
import '../application_constants.dart';
import '../provider.dart';
import '../translation_constants.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "home";
  final List<String> columnHeaders = [ApplicationUtil.translate(cattleType), ApplicationUtil.translate(quantity)];
  final String tableHeading = ApplicationUtil.translate(todayReport);

  final milkingDataProvider = StateNotifierProvider((ref) => MilkingDataNotifier(ref.read));

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
      ApplicationUtil.translate(CattleType.Cow.toShortString()) + " (" + cow_count.toString() + ")":
          cowTotalMilk > 1000 ? (cowTotalMilk / 1000.0).toString() + " L" : cowTotalMilk.toString() + " ml",
      ApplicationUtil.translate(CattleType.Buffalo.toShortString()) + " (" + buffalo_count.toString() + ")":
          buffaloTotalMilk > 1000 ? (buffaloTotalMilk / 1000.0).toString() + " L" : buffaloTotalMilk.toString() + " ml",
      ApplicationUtil.translate(kTotal): totalMilk > 1000 ? (totalMilk / 1000.0).toString() + " L" : totalMilk.toString() + " ml"
    };
  }

  Future<AsyncValue> getTodayEntries(context) async {
    return await context(milkingClient).populateFromServer();
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

import 'package:dairy_farm/util/milking_data_client.dart';

//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'models/milking_entry.dart';
//
//var milkingDataClientProvider = Provider((ref) => MilkingDataClient());
//
//final futureProvider = FutureProvider.autoDispose.family<String, MilkingEntry>(
//    (ref, milkingEntry) =>
//        ref.watch(milkingDataClientProvider).submitMilkingEntry(milkingEntry));

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'application/notifier/milking_data.dart';
import 'models/milking_entry.dart';

final serverClient = Provider((ref) => MilkingDataClient(ref.read));

final clientStatus = StateProvider.autoDispose<AsyncValue<String>>((ref) => null);


final navigation_select = StateProvider<int>((ref) => 0);

StateProvider<MilkingEntry> milkEntryProvider = StateProvider<MilkingEntry>((ref) => MilkingEntry());

final milkingDataProvider = StateNotifierProvider((ref) => MilkingDataNotifier(ref.read));



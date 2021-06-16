import 'dart:convert';

import 'package:dairy_farm/models/milking_entry.dart';
import 'package:dairy_farm/util/applicaition_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider.dart';

class MilkingDataNotifier extends StateNotifier<AsyncValue<List<MilkingEntry>>> {
  Reader serverClientReader;

  reload([DateTime from, DateTime to]) {
    _loadMilkingEntry(from, to);
  }

  _loadMilkingEntry([DateTime from, DateTime to]) async {
    try {
      List<MilkingEntry> entries = await serverClientReader(milkingClient).populateFromServer(from, to);
      state = AsyncData(entries);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }

  MilkingDataNotifier(this.serverClientReader, [List<MilkingEntry> milkingEntryList])
      : super(milkingEntryList ?? AsyncValue.loading()) {
    print("milkingDataNotifier Initialised");
    _loadMilkingEntry();
  }

  Future<bool> add(MilkingEntry entry) async {
    serverClientReader(clientStatus).state = AsyncLoading();
    try {
      var response = await serverClientReader(milkingClient).submitMilkingEntry(entry);
      if (response.statusCode == 200) {
        serverClientReader(clientStatus).state =
            AsyncData(ApplicationUtil.translate("Milking entry successfully created"));
        var inserted_entry = MilkingEntry.fromJson(json.decode(response.body));
        state = state.whenData((entries) => entries..add(inserted_entry));
        return true;
      } else
        serverClientReader(clientStatus).state = AsyncError(ApplicationUtil.translate("Error while creating milking entry"));
    } catch (e) {
      serverClientReader(clientStatus).state = AsyncError(ApplicationUtil.translate("Exception occured while creating milking entry"));
    }
    return false;
  }

  Future<bool> update(MilkingEntry updatedEntry) async {
    serverClientReader(clientStatus).state = AsyncLoading();
    try {
      var response = await serverClientReader(milkingClient).updateMilkingEntry(updatedEntry);
      if (response.statusCode == 200) {
        serverClientReader(clientStatus).state =
            AsyncData(ApplicationUtil.translate(ApplicationUtil.translate("Milking entry successfully updated")));
        state = state.whenData((entries) {
          return [
            for (final entry in entries)
              if (entry.dataBaseId == updatedEntry.dataBaseId) updatedEntry else entry
          ];
        });
        return true;
      } else
        serverClientReader(clientStatus).state = AsyncError(ApplicationUtil.translate("Error while updating milking entry"));
    } catch (e) {
      serverClientReader(clientStatus).state = AsyncError(ApplicationUtil.translate("Exception occured while updating milking entry"));
    }
    return false;
  }

  Future<bool> delete(MilkingEntry entry, index) async {
    serverClientReader(clientStatus).state = AsyncLoading();
    try {
      var response = await serverClientReader(milkingClient).deleteEntry(entry);
      if (response.statusCode == 200) {
        serverClientReader(clientStatus).state = AsyncData(ApplicationUtil.translate("Milking Entry successfully deleted"));
        state = state.whenData((entries) => entries..removeAt(index));
        return true;
      } else
        serverClientReader(clientStatus).state = AsyncError(ApplicationUtil.translate("Error while deleting milking entry"));
    } catch (e) {
      serverClientReader(clientStatus).state = AsyncError(ApplicationUtil.translate("Exception occured while deleting milking entry"));
    }
    return false;
  }
}

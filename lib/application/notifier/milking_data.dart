import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:dairy_farm/application_constants.dart';
import 'package:dairy_farm/enums/cattle_type.dart';

import '../../provider.dart';

class MilkingDataNotifier extends StateNotifier<AsyncValue<List<MilkingEntry>>> {
  Reader serverClientReader;

  reload([DateTime from,DateTime to]) {
    _loadMilkingEntry(from,to);
  }

  _loadMilkingEntry([DateTime from, DateTime to]) async {
    try {
      List<MilkingEntry> entries = await serverClientReader(serverClient).populateFromServer(from, to);
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

  Future<void> add(MilkingEntry entry) async {
    serverClientReader(clientStatus).state = AsyncLoading();
    try {
      var response = await serverClientReader(serverClient).submitMilkingEntry(entry);
      if (response.statusCode == 200) {
        serverClientReader(clientStatus).state = AsyncData("Milking entry successfully created");
        var inserted_entry = MilkingEntry.fromJson(json.decode(response.body));
        state = state.whenData((entries) => entries..add(inserted_entry));
      } else
        serverClientReader(clientStatus).state = AsyncError("Error while created milking entry");
    } catch (e) {
      serverClientReader(clientStatus).state = AsyncError("Exception occured while created milking entry");
    }
  }

  Future<void> update(MilkingEntry updatedEntry) async {
    serverClientReader(clientStatus).state = AsyncLoading();
    try {
      var response = await serverClientReader(serverClient).updateMilkingEntry(updatedEntry);
      if (response.statusCode == 200) {
        serverClientReader(clientStatus).state = AsyncData("Milking entry successfully updated");
        state = state.whenData((entries) {
          return [
            for (final entry in entries)
              if (entry.dataBaseId == updatedEntry.dataBaseId) updatedEntry else entry
          ];
        });
      } else
        serverClientReader(clientStatus).state = AsyncError("Error while updating milking entry");
    } catch (e) {
      serverClientReader(clientStatus).state = AsyncError("Exception occured while updating milking entry");
    }
  }

  Future<void> delete(MilkingEntry entry, index) async {
    serverClientReader(clientStatus).state = AsyncLoading();
    try {
      var response = await serverClientReader(serverClient).deleteEntry(entry);
      if (response.statusCode == 200) {
        serverClientReader(clientStatus).state = AsyncData("Milking Entry successfully deleted");
        state = state.whenData((entries) => entries..removeAt(index));
      } else
        serverClientReader(clientStatus).state = AsyncError("Error while deleting milking entry");
    } catch (e) {
      serverClientReader(clientStatus).state = AsyncError("Exception occured while deleting milking entry");
    }
  }
}

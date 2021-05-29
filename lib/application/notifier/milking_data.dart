import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:dairy_farm/application_constants.dart';
import 'package:dairy_farm/enums/cattle_type.dart';

import '../../provider.dart';

class MilkingDataNotifier extends StateNotifier<AsyncValue<List<MilkingEntry>>> {

  Reader serverClientReader;

  reload(){
    _loadMilkingEntry();
  }

  _loadMilkingEntry() async {
    try {
      List<MilkingEntry> entries = await serverClientReader(serverClient).populateFromServer();
      state = AsyncData(entries);
    }
    catch (e,s) {
        state = AsyncError(e,s);
    }
  }

  MilkingDataNotifier(this.serverClientReader, [List<MilkingEntry> milkingEntryList])
      : super(milkingEntryList ?? AsyncValue.loading()) {
    print("milkingDataNotifier Initialised");
    _loadMilkingEntry();
  }
  

  void add(MilkingEntry entry) {
    state = state.whenData((entries) => entries..add(entry));
  }

}

import 'package:dairy_farm/components/date_picker.dart';
import 'package:dairy_farm/components/milking_form.dart';
import 'package:dairy_farm/components/my_scaffold.dart';
import 'package:dairy_farm/enums/cattle_type.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:dairy_farm/translation_constants.dart';
import 'package:dairy_farm/util/applicaition_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../provider.dart';

class MilkingListScreen extends HookWidget {
  static const String id = "milking_data_screen";

  DateTime from = ApplicationUtil.midnight();
  DateTime to = ApplicationUtil.midnight().add(Duration(days: 1));

  final filteredCattleType = StateProvider<String>((ref) => "ALL");
  final sortedBy = StateProvider<String>((ref) => "date");

  onSort(entries, sortOption) {
    switch (sortOption) {
      case "date":
        entries.sort(
            (MilkingEntry a, MilkingEntry b) => a.dateTime.toIso8601String().compareTo(b.dateTime.toIso8601String()));
        break;
      case "cattleNumber":
        entries.sort(((MilkingEntry a, MilkingEntry b) => a.cattleNumber.compareTo(b.cattleNumber)));
        break;
      case "milkQuantity":
        entries.sort(((MilkingEntry a, MilkingEntry b) => a.milkQuantity.compareTo(b.milkQuantity)));
        break;
      case "milker":
        entries.sort(((MilkingEntry a, MilkingEntry b) => a.milker.compareTo(b.milker)));
        break;
      case "cattleType":
        entries.sort(((MilkingEntry a, MilkingEntry b) => a.cattleType.compareTo(b.cattleType)));
        break;
    }
    return entries;
  }

  filterByCattleType(entries, cattleType) {
    return entries.where((MilkingEntry element) => element.cattleType == cattleType).toList();
  }

  @override
  Widget build(BuildContext context) {
    final milkEntries = useProvider(milkingDataProvider.state);
    print("building consumer homeScreen");
    return MyScaffold(milkEntries.when(
        data: (milkingEntries) => buildSafeArea(context, milkingEntries),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, s) => Text(e.toString())));
  }

  SafeArea buildSafeArea(BuildContext context, List<MilkingEntry> entries) {
    print("building MilkingListScreen");
    var filterCattle = useProvider(filteredCattleType).state;
    var sortBy = useProvider(sortedBy).state;
    var cattleOptions = CattleType.values.map((e) => e.toShortString()).toList();
    var sortOptions = MilkingEntry().toJson().keys.toList();
    sortOptions.remove("_id");
    if (filterCattle != 'ALL') {
      entries = filterByCattleType(entries, filterCattle);
    }
    if (entries.isNotEmpty) entries = onSort(entries, sortBy);
    cattleOptions.add("ALL");
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextFieldDatePicker(
                    width: 200.0,
                    labelText: ApplicationUtil.translate("from"),
                    dateFormat: DateFormat.yMd(),
                    prefixIcon: Icon(Icons.date_range),
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    lastDate: DateTime.now().add(Duration(days: 366)),
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(Duration(days: 365)),
                    onDateChanged: (selectedDate) {
                      from = selectedDate;
                      context.read(milkingDataProvider).reload(from, to);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextFieldDatePicker(
                    width: 200.0,
                    labelText: ApplicationUtil.translate("to"),
                    dateFormat: DateFormat.yMd(),
                    prefixIcon: Icon(Icons.date_range),
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    lastDate: DateTime.now().add(Duration(days: 366)),
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(Duration(days: 365)),
                    onDateChanged: (selectedDate) {
                      to = ApplicationUtil.midnight(selectedDate).add(Duration(days: 1));
                      context.read(milkingDataProvider).reload(from, to);
                    },
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      value: filterCattle,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: ApplicationUtil.translate(filterBy)),
                      onChanged: (cattleType) => {
                        context.read(filteredCattleType).state =
                            cattleOptions.firstWhere((element) => element == cattleType)
                      },
                      items: cattleOptions.map((e) => e).toList().map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(ApplicationUtil.translate(value.toUpperCase())),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 180,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: sortBy,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: ApplicationUtil.translate(sortingBy)),
                      onChanged: (sortOption) => {context.read(sortedBy).state = sortOption},
                      items: sortOptions.map((e) => e).toList().map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            ApplicationUtil.translate(value),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: entries.toList().length,
                  itemBuilder: (BuildContext context, int index) {
                    MilkingEntry milkingEntry = entries.elementAt(index);
                    return ListTile(
                      leading: CircleAvatar(radius: 40, child: Text(milkingEntry.cattleNumber.toString())),
                      title: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: ApplicationUtil.translate(milkingEntry.cattleType),
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print(milkingEntry.cattleType);
                                  }),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            DateFormat('yyyy-MM-dd   h:mma').format(milkingEntry.dateTime),
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
                          )
                        ],
                      ),
                      subtitle: Text(ApplicationUtil.translate(milkingEntry.milker)),
                      trailing: Text(
                          milkingEntry.milkQuantity > 1000
                              ? (milkingEntry.milkQuantity / 1000.0).toString() + " L"
                              : milkingEntry.milkQuantity.toString() + " ml",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(content: Text('Do you want to delete the entry ?'),
                                  // Message which will be pop up on the screen
                                  // Action widget which will provide the user to acknowledge the choice
                                  actions: [
                                    ElevatedButton(
                                      // FlatButton widget is used to make a text to work like a button
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }, // function used to perform after pressing the button
                                      child: Text('No'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        context.read(milkingDataProvider).delete(milkingEntry, index);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Yes'),
                                    ),
                                  ]);
                            });
                      },
                      onTap: () {
                        context.read(milkEntryProvider).state = milkingEntry;
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => SingleChildScrollView(
                                    child: Container(
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 40),
                                  child: MilkingForm(true),
                                )));
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

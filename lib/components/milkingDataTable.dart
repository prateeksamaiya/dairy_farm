import 'package:dairy_farm/application/notifier/milking_data.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:dairy_farm/screens/milking_screen.dart';
import 'package:dairy_farm/util/applicaition_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import '../provider.dart';
import 'date_picker.dart';
import 'milking_form.dart';

class MyDataTable extends HookWidget {
  final List<String> columnHeaders;
  final String tableHeading;
  List<MilkingEntry> rowData;
  DateTime from =  ApplicationUtil.midnight();
  DateTime to =  ApplicationUtil.midnight().add(Duration(days: 1));

  MyDataTable({this.columnHeaders, this.tableHeading, this.rowData});

  final sortIndexProvider = StateProvider<int>((ref) => 0);

  onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        rowData.sort((a, b) => a.cattleNumber.compareTo(b.cattleNumber));
      } else {
        rowData.sort((a, b) => b.cattleNumber.compareTo(a.cattleNumber));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final sortIndex = useProvider(sortIndexProvider).state;
    print(sortIndex);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                MyTextFieldDatePicker(
                  width: 200.0,
                  labelText: "from",
                  dateFormat: DateFormat.yMd(),
                  prefixIcon: Icon(Icons.date_range),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  lastDate: DateTime.now().add(Duration(days: 366)),
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 365)),
                  onDateChanged: (selectedDate) {
                    from = selectedDate;
                   context.read(milkingDataProvider).reload(from,to);
                  },
                ),
                MyTextFieldDatePicker(
                  width: 200.0,
                  labelText: "to",
                  dateFormat: DateFormat.yMd(),
                  prefixIcon: Icon(Icons.date_range),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  lastDate: DateTime.now().add(Duration(days: 366)),
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 365)),
                  onDateChanged: (selectedDate) {
                    to = ApplicationUtil.midnight(selectedDate) .add(Duration(days: 1));
                    context.read(milkingDataProvider).reload(from,to);
                  },
                )
              ]),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: rowData.toList().length,
                  itemBuilder: (BuildContext context, int index) {
                    print(index);
                    MilkingEntry milkingEntry = rowData.elementAt(index);
                    return ListTile(
                      leading: CircleAvatar(radius: 35, child: Text(milkingEntry.cattleNumber.toString())),
                      title: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: milkingEntry.cattleType,
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
                      subtitle: Text(milkingEntry.milker),
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
                                      child: Text('CANCEL'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        context.read(milkingDataProvider).delete(milkingEntry, index);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('ACCEPT'),
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
                                  padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top + 20),
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

//  SingleChildScrollView ScrollableDataTable(int sortIndex) {
//    return SingleChildScrollView(
//      scrollDirection: Axis.vertical,
//      child: rowData.toList().isEmpty
//          ? Padding(
//              padding: const EdgeInsets.only(top: 100),
//              child: Center(child: Text("No Entry For Today")),
//            )
//          : SingleChildScrollView(
//              scrollDirection: Axis.horizontal,
//              child: DataTable(
//                headingRowColor: MaterialStateProperty.all(Colors.amber[200]),
//                sortAscending: true,
//                showCheckboxColumn: true,
//                sortColumnIndex: sortIndex,
//                columnSpacing: 35,
//                showBottomBorder: true,
//                columns: Map<String, dynamic>.from(rowData.first.toJson())
//                    .keys
//                    .toList()
//                    .where((element) => element != "_id")
//                    .map((String value) {
//                  int index = Map<String, dynamic>.from(rowData.first.toJson()).keys.toList().indexOf(value);
//                  return DataColumn(
//                      onSort: onSort(sortIndex, true),
//                      label: Text(
//                        value.split(new RegExp("(?=[A-Z]+)")).join(" ").toUpperCase(),
//                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
//                      ));
//                }).toList(),
//                rows: rowData
//                    .map((milkingEntry) => DataRow(
//                        cells: Map<String, dynamic>.from(milkingEntry.toJson())
//                            .entries
//                            .where((element) => element.key != "_id")
//                            .map((entry) => DataCell(Center(
//                                  child: Text(
//                                    entry.value.toString(),
//                                  ),
//                                )))
//                            .toList()))
//                    .toList(),
//              ),
//            ),
//    );
//  }
}

import 'package:dairy_farm/models/milking_entry.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyDataTable extends HookWidget {
  final List<String> columnHeaders;
  final String tableHeading;
  List<MilkingEntry> rowData;

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
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: rowData.toList().isEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(child: Text("No Entry For Today")),
              )
            : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  headingRowColor: MaterialStateProperty.all(Colors.amber[200]),
                  sortAscending: true,
                  showCheckboxColumn: true,
                  sortColumnIndex: sortIndex,
                  columnSpacing: 35,
                  showBottomBorder: true,
                  columns: Map<String, dynamic>.from(rowData.first.toJson())
                      .keys
                      .toList()
                      .where((element) => element != "_id")
                      .map((String value) {
                    int index = Map<String, dynamic>.from(rowData.first.toJson()).keys.toList().indexOf(value);
                    return DataColumn(
                        onSort: onSort(sortIndex, true),
                        label: Text(
                          value.split(new RegExp("(?=[A-Z]+)")).join(" ").toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                        ));
                  }).toList(),
                  rows: rowData
                      .map((milkingEntry) => DataRow(
                          cells: Map<String, dynamic>.from(milkingEntry.toJson())
                              .entries
                              .where((element) => element.key != "_id")
                              .map((entry) => DataCell(Center(
                                    child: Text(
                                      entry.value.toString(),
                                    ),
                                  )))
                              .toList()))
                      .toList(),
                ),
            ),
      ),
    );
  }

//  final random =
}

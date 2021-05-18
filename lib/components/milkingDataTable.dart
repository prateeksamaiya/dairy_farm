import 'package:dairy_farm/models/milking_entry.dart';
import 'package:flutter/material.dart';

class MyDataTable extends StatelessWidget {
  final List<String> columnHeaders;
  final String tableHeading;
  List<MilkingEntry> rowData;

  MyDataTable({this.columnHeaders, this.tableHeading, this.rowData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          showCheckboxColumn: true,
          columnSpacing: 10,
          showBottomBorder: true,
          columns: Map<String, dynamic>.from(rowData.first.toJson()).keys.map<DataColumn>(
            (String value) {
              return DataColumn(
                  label: Text(
                value.split(new RegExp("(?=[A-Z]+)")).join(" ").toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ));
            },
          ).toList(),
          rows: rowData
              .map((milkingEntry) => DataRow(
                  cells: Map<String, dynamic>.from(milkingEntry.toJson())
                      .values
                      .map((key) => DataCell(Text(
                            key.toString(),
                          )))
                      .toList()))
              .toList(),
        ),
      ),
    );
  }

//  final random =
}

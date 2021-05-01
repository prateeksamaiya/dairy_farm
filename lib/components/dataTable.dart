import 'package:flutter/material.dart';

class MyDataTable extends StatelessWidget {
  final List<String> columnHeaders = ["Cattle", "Quantity (l)l"];
  final String tableHeading = "Today's Report";
  final rowData;

  MyDataTable({this.rowData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                tableHeading,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              DataTable(
                showBottomBorder: true,
                columns: columnHeaders.map<DataColumn>(
                  (String value) {
                    return DataColumn(
                        label: Text(value,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)));
                  },
                ).toList(),
                rows: Map<String, String>.from(rowData)
                    .entries
                    .map((entry) => DataRow(cells: [
                          DataCell(Text(entry.key)),
                          DataCell(Text(entry.value)),
                        ]))
                    .toList(),
              ),
            ]),
      ),
    );
  }
}

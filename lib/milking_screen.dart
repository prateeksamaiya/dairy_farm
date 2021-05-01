import 'package:flutter/material.dart';
import 'components/my_scaffold.dart';
import 'components/my_drop_down.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'application_constants.dart';
import 'enums/cattleType.dart';
import 'enums/cattleType.dart';

class MilkingScreen extends StatefulWidget {
  static const String id = "milking";
  @override
  _MilkingScreenState createState() => _MilkingScreenState();
}

class _MilkingScreenState extends State<MilkingScreen> {
  final String url = "10.0.2.2:5000";
  final cattleNumberController = TextEditingController();
  final milkQuantityController = TextEditingController();
  String selectedMilker = "Manish Samaiya";
  String selectedCattleType = cattleType.Buffalo.toShortString();
  Map<String, String> milkingEntry = new Map();


  void updateMilkingData(milkingEntry) async {
    milkingEntry[kmilker] = selectedMilker;
    milkingEntry[kcattleType] = selectedCattleType;
    try {
      await http.post(
        Uri.http(url, "/milking/update"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(milkingEntry),
      );
      print("worked");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyDropDownButton(
                  value: selectedMilker,
                  items: ['Manish Samaiya', 'Nanhe', 'Alim', 'Laxman'],
                  itemIcon: Icon(Icons.person),
                  onChanged: (milkerName) => {
                        setState(() {
                          selectedMilker = milkerName;
                        }),
                      }),
              MyDropDownButton(
                  value: selectedCattleType,
                  items: cattleType.values.map((e) => e.toShortString()).toList(),
                  itemIcon: Icon(Icons.ac_unit),
                  onChanged: (cattleType) => {
                        setState(() {
                          selectedCattleType = cattleType;
                        }),
                      }),
              TextField(
                controller: cattleNumberController,
                onChanged: (cattleNumber) {
                  milkingEntry[kcattleNumber] = cattleNumber;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter Cattle Number'),
              ),
              TextField(
                controller: this.milkQuantityController,
                onChanged: (milkQuantity) {
                  milkingEntry[kmilkQuantity] = milkQuantity;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter Milk Quantity'),
              ),
              ElevatedButton(
                onPressed: () {
                  updateMilkingData(milkingEntry);
                  milkQuantityController.clear();
                  cattleNumberController.clear();
                },
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

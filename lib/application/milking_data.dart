import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'milking_entry.dart';
import 'package:dairy_farm/application_constants.dart';
import 'package:dairy_farm/enums/cattleType.dart';


class MilkingData extends StateNotifier<MilkingData>{

  String path = "/fetch/record/milking/today";
  List<MilkingEntry> _data = [];


  MilkingData(MilkingData state) : super(state);


  void update(MilkingEntry entry){
    _data.add(entry);
  }

  void remove(int index){
    _data.removeAt(index);
  }


   void populateFromServer() async{
    _data = [];
    try {
      var response = await http.get(
        Uri.http(kBackEndUrl, path),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );

      if (response.statusCode == 200){
        for(Map<String,dynamic> entry in json.decode(response.body)){
          print(entry);
          MilkingEntry milkingEntry = MilkingEntry();
          milkingEntry.fromJson(entry);
          _data.add(milkingEntry);
        }
        print(_data.length);
      }
    } catch (e) {
      print(e);
    }
  }

    totalCounts(){
    double cowTotalMilk = 0;
    double buffaloTotalMilk = 0;
    double totalMilk = 0;

    for(MilkingEntry entry in _data){
      if(entry.cattleType == cattleType.Buffalo.toShortString()){
        buffaloTotalMilk += entry.milkQuantity;
      }

      if(entry.cattleType == cattleType.Cow.toShortString()){
        cowTotalMilk += entry.milkQuantity;
      }
      totalMilk += entry.milkQuantity;
    }
    return {
      cattleType.Cow.toShortString(): cowTotalMilk.toString(),
      cattleType.Buffalo.toShortString(): buffaloTotalMilk.toString(),
      kTotal: totalMilk.toString(),
    };

  }
}
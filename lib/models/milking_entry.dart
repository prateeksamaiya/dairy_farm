import 'package:dairy_farm/application_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MilkingEntry{
  String milker;
  String cattleType;
  int cattleNumber;
  double milkQuantity;


  void fromJson(Map<String,dynamic> json){
    this.milker = json[kmilker];
    this.cattleType = json[kcattleType];
    this.cattleNumber = json[kcattleNumber];
    this.milkQuantity = json[kmilkQuantity];
  }
}
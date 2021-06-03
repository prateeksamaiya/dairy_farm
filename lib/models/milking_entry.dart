//import 'package:dairy_farm/application_constants.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//
//class MilkingEntry{
//  String milker;
//  String cattleType;
//  int cattleNumber;
//  double milkQuantity;
//
//  MilkingEntry({this.milker,this.cattleType,this.milkQuantity,this.cattleNumber});
//
//
//  void fromJson(Map<String,dynamic> json){
//    this.milker = json[kmilker];
//    this.cattleType = json[kcattleType];
//    this.cattleNumber = json[kcattleNumber];
//    this.milkQuantity = json[kmilkQuantity];
//  }
//
//  dynamic toJson() =>
//      {
//        'milker': this.milker,
//        'cattleType': this.cattleType,
//        'cattleNumber': this.cattleNumber,
//        'milkQuantity': this.milkQuantity
//      };
//}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'milking_entry.freezed.dart';

part 'milking_entry.g.dart';

@freezed
abstract class MilkingEntry with _$MilkingEntry {
  const factory MilkingEntry(
      [@JsonKey(name: '_id') Map<String, String> dataBaseId,
      @Default("Buffalo") String cattleType,
      int cattleNumber,
      int milkQuantity,
      @JsonKey(name: 'date',fromJson: MilkingEntry._fromJson) DateTime dateTime,
      @Default("Manish Samaiya") String milker]) = _MilkingEntry;

  static DateTime _fromJson(Map<String,dynamic> dateJson) => DateTime.fromMillisecondsSinceEpoch(dateJson.entries.first.value).toLocal();

  factory MilkingEntry.fromJson(Map<String, dynamic> json) => _$MilkingEntryFromJson(json);
}

//@freezed
//abstract class clientResponse with _$clientResponse{
//  const factory clientResponse.idle() = Idle;
//  const factory clientResponse.success(String msg) = Success;
//  const factory clientResponse.error(String msg) = Error;
//  const factory clientResponse.loading() = Loading;
//}

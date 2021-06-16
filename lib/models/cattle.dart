import 'package:dairy_farm/enums/cattle_gender.dart';
import 'package:dairy_farm/enums/cattle_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'dairy_farm.dart';

part 'cattle.freezed.dart';

part 'cattle.g.dart';

@freezed
abstract class CattleEntry with _$CattleEntry {
  const factory CattleEntry([
    @JsonKey(name: '_id') Map<String,String> dataBaseId,
    String tagNumber,
    CattleType type,
    CattleGender gender,
    DairyFarm boughtFrom,
    int price,
    int age,
    int childrenCount,
    int numberOfTeeth,
    String breed,
    double milkPromised,
    DateTime broughtInDate,
    @Default(false) bool isSold,
    @Default(false) bool isDead,
  ]) = _CattleEntry;

  factory CattleEntry.fromJson(Map<String, dynamic> json) => _$CattleEntryFromJson(json);
}

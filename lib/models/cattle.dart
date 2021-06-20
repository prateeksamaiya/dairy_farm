import 'package:dairy_farm/enums/cattle_gender.dart';
import 'package:dairy_farm/enums/cattle_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'cattle_status.dart';

part 'cattle.freezed.dart';

part 'cattle.g.dart';

@freezed
abstract class CattleEntry with _$CattleEntry {
  const CattleEntry._();

  const factory CattleEntry([
    @JsonKey(name: '_id') Map<String, String> dataBaseId,
    String tagNumber,
    CattleType type,
    CattleGender gender,
    String sellerDairy,
    CattleStatus currentStatus,
    @Default([]) List<CattleStatus> statusHistory,
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

  static CattleEntry updateCattleHistory(CattleEntry entry) {
    if (entry.statusHistory.isEmpty ||
        DateTime.now().millisecond - entry.statusHistory.last.changed_on.add(Duration(days: 30)).millisecond > 0) {
      entry = entry.copyWith(statusHistory: List.from(entry.statusHistory)..add(entry.currentStatus));
    } else {
      entry = entry.copyWith(statusHistory: List.from(entry.statusHistory)..removeLast()..add(entry.currentStatus));
    }
    return entry;
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'dairy_farm.freezed.dart';
part 'dairy_farm.g.dart';

@freezed
abstract class DairyFarm with _$DairyFarm {
  const factory DairyFarm(
    [ @JsonKey(name:'_id') String id,
    String name,
    String ownerName,
    String location,
    String state]) = _DairyFarm;

  factory DairyFarm.fromJson(Map<String, dynamic> json) => _$DairyFarmFromJson(json);
}

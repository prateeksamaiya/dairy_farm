import 'package:dairy_farm/enums/cattle_gender.dart';
import 'package:dairy_farm/enums/cattle_status.dart';
import 'package:dairy_farm/enums/cattle_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'dairy_farm.dart';

part 'cattle_status.freezed.dart';

part 'cattle_status.g.dart';

@freezed
abstract class CattleStatus with _$CattleStatus {
  const factory CattleStatus([
    CattleStatusEnum status,
    DateTime changed_on,
    @JsonKey(name: '_id') Map<String,String> dataBaseId,
    String lastModifiedBy
  ]) = _CattleStatus;

  factory CattleStatus.fromJson(Map<String, dynamic> json) => _$CattleStatusFromJson(json);
}

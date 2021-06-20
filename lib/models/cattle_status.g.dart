// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cattle_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CattleStatus _$_$_CattleStatusFromJson(Map<String, dynamic> json) {
  return _$_CattleStatus(
    _$enumDecodeNullable(_$CattleStatusEnumEnumMap, json['status']),
    json['changed_on'] == null
        ? null
        : DateTime.parse(json['changed_on'] as String),
    (json['_id'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    json['lastModifiedBy'] as String,
  );
}

Map<String, dynamic> _$_$_CattleStatusToJson(_$_CattleStatus instance) =>
    <String, dynamic>{
      'status': _$CattleStatusEnumEnumMap[instance.status],
      'changed_on': instance.changed_on?.toIso8601String(),
      '_id': instance.dataBaseId,
      'lastModifiedBy': instance.lastModifiedBy,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$CattleStatusEnumEnumMap = {
  CattleStatusEnum.Lactating: 'Lactating',
  CattleStatusEnum.Dry: 'Dry',
  CattleStatusEnum.Pregnant: 'Pregnant',
};

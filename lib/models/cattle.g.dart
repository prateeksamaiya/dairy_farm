// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cattle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cattle _$_$_CattleFromJson(Map<String, dynamic> json) {
  return _$_Cattle(
    (json['_id'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    json['tagNumber'] as String,
    _$enumDecodeNullable(_$CattleTypeEnumMap, json['type']),
    _$enumDecodeNullable(_$CattleGenderEnumMap, json['gender']),
    json['boughtFrom'] == null
        ? null
        : DairyFarm.fromJson(json['boughtFrom'] as Map<String, dynamic>),
    json['price'] as int,
    json['age'] as int,
    json['childrenCount'] as int,
    json['numberOfTeeth'] as int,
    json['breed'] as String,
    (json['milkPromised'] as num)?.toDouble(),
    json['broughtInDate'] == null
        ? null
        : DateTime.parse(json['broughtInDate'] as String),
    json['isSold'] as bool ?? false,
    json['isDead'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_CattleToJson(_$_Cattle instance) => <String, dynamic>{
      '_id': instance.dataBaseId,
      'tagNumber': instance.tagNumber,
      'type': _$CattleTypeEnumMap[instance.type],
      'gender': _$CattleGenderEnumMap[instance.gender],
      'boughtFrom': instance.boughtFrom,
      'price': instance.price,
      'age': instance.age,
      'childrenCount': instance.childrenCount,
      'numberOfTeeth': instance.numberOfTeeth,
      'breed': instance.breed,
      'milkPromised': instance.milkPromised,
      'broughtInDate': instance.broughtInDate?.toIso8601String(),
      'isSold': instance.isSold,
      'isDead': instance.isDead,
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

const _$CattleTypeEnumMap = {
  CattleType.Cow: 'Cow',
  CattleType.Buffalo: 'Buffalo',
};

const _$CattleGenderEnumMap = {
  CattleGender.Male: 'Male',
  CattleGender.Female: 'Female',
  CattleGender.Other: 'Other',
};

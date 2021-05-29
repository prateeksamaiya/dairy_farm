// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milking_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MilkingEntry _$_$_MilkingEntryFromJson(Map<String, dynamic> json) {
  return _$_MilkingEntry(
    (json['_id'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    json['cattleType'] as String ?? 'Buffalo',
    json['cattleNumber'] as int ?? 1,
    (json['milkQuantity'] as num)?.toDouble() ?? 0.0,
    json['milker'] as String ?? 'Manish Samaiya',
  );
}

Map<String, dynamic> _$_$_MilkingEntryToJson(_$_MilkingEntry instance) =>
    <String, dynamic>{
      '_id': instance.dataBaseId,
      'cattleType': instance.cattleType,
      'cattleNumber': instance.cattleNumber,
      'milkQuantity': instance.milkQuantity,
      'milker': instance.milker,
    };

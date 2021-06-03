// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'milking_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MilkingEntry _$MilkingEntryFromJson(Map<String, dynamic> json) {
  return _MilkingEntry.fromJson(json);
}

/// @nodoc
class _$MilkingEntryTearOff {
  const _$MilkingEntryTearOff();

// ignore: unused_element
  _MilkingEntry call(
      [@JsonKey(name: '_id')
          Map<String, String> dataBaseId,
      String cattleType = "Buffalo",
      int cattleNumber,
      int milkQuantity,
      @JsonKey(name: 'date', fromJson: MilkingEntry._fromJson)
          DateTime dateTime,
      String milker = "Manish Samaiya"]) {
    return _MilkingEntry(
      dataBaseId,
      cattleType,
      cattleNumber,
      milkQuantity,
      dateTime,
      milker,
    );
  }

// ignore: unused_element
  MilkingEntry fromJson(Map<String, Object> json) {
    return MilkingEntry.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $MilkingEntry = _$MilkingEntryTearOff();

/// @nodoc
mixin _$MilkingEntry {
  @JsonKey(name: '_id')
  Map<String, String> get dataBaseId;
  String get cattleType;
  int get cattleNumber;
  int get milkQuantity;
  @JsonKey(name: 'date', fromJson: MilkingEntry._fromJson)
  DateTime get dateTime;
  String get milker;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $MilkingEntryCopyWith<MilkingEntry> get copyWith;
}

/// @nodoc
abstract class $MilkingEntryCopyWith<$Res> {
  factory $MilkingEntryCopyWith(
          MilkingEntry value, $Res Function(MilkingEntry) then) =
      _$MilkingEntryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id')
          Map<String, String> dataBaseId,
      String cattleType,
      int cattleNumber,
      int milkQuantity,
      @JsonKey(name: 'date', fromJson: MilkingEntry._fromJson)
          DateTime dateTime,
      String milker});
}

/// @nodoc
class _$MilkingEntryCopyWithImpl<$Res> implements $MilkingEntryCopyWith<$Res> {
  _$MilkingEntryCopyWithImpl(this._value, this._then);

  final MilkingEntry _value;
  // ignore: unused_field
  final $Res Function(MilkingEntry) _then;

  @override
  $Res call({
    Object dataBaseId = freezed,
    Object cattleType = freezed,
    Object cattleNumber = freezed,
    Object milkQuantity = freezed,
    Object dateTime = freezed,
    Object milker = freezed,
  }) {
    return _then(_value.copyWith(
      dataBaseId: dataBaseId == freezed
          ? _value.dataBaseId
          : dataBaseId as Map<String, String>,
      cattleType:
          cattleType == freezed ? _value.cattleType : cattleType as String,
      cattleNumber:
          cattleNumber == freezed ? _value.cattleNumber : cattleNumber as int,
      milkQuantity:
          milkQuantity == freezed ? _value.milkQuantity : milkQuantity as int,
      dateTime: dateTime == freezed ? _value.dateTime : dateTime as DateTime,
      milker: milker == freezed ? _value.milker : milker as String,
    ));
  }
}

/// @nodoc
abstract class _$MilkingEntryCopyWith<$Res>
    implements $MilkingEntryCopyWith<$Res> {
  factory _$MilkingEntryCopyWith(
          _MilkingEntry value, $Res Function(_MilkingEntry) then) =
      __$MilkingEntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id')
          Map<String, String> dataBaseId,
      String cattleType,
      int cattleNumber,
      int milkQuantity,
      @JsonKey(name: 'date', fromJson: MilkingEntry._fromJson)
          DateTime dateTime,
      String milker});
}

/// @nodoc
class __$MilkingEntryCopyWithImpl<$Res> extends _$MilkingEntryCopyWithImpl<$Res>
    implements _$MilkingEntryCopyWith<$Res> {
  __$MilkingEntryCopyWithImpl(
      _MilkingEntry _value, $Res Function(_MilkingEntry) _then)
      : super(_value, (v) => _then(v as _MilkingEntry));

  @override
  _MilkingEntry get _value => super._value as _MilkingEntry;

  @override
  $Res call({
    Object dataBaseId = freezed,
    Object cattleType = freezed,
    Object cattleNumber = freezed,
    Object milkQuantity = freezed,
    Object dateTime = freezed,
    Object milker = freezed,
  }) {
    return _then(_MilkingEntry(
      dataBaseId == freezed
          ? _value.dataBaseId
          : dataBaseId as Map<String, String>,
      cattleType == freezed ? _value.cattleType : cattleType as String,
      cattleNumber == freezed ? _value.cattleNumber : cattleNumber as int,
      milkQuantity == freezed ? _value.milkQuantity : milkQuantity as int,
      dateTime == freezed ? _value.dateTime : dateTime as DateTime,
      milker == freezed ? _value.milker : milker as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_MilkingEntry implements _MilkingEntry {
  const _$_MilkingEntry(
      [@JsonKey(name: '_id') this.dataBaseId,
      this.cattleType = "Buffalo",
      this.cattleNumber,
      this.milkQuantity,
      @JsonKey(name: 'date', fromJson: MilkingEntry._fromJson) this.dateTime,
      this.milker = "Manish Samaiya"])
      : assert(cattleType != null),
        assert(milker != null);

  factory _$_MilkingEntry.fromJson(Map<String, dynamic> json) =>
      _$_$_MilkingEntryFromJson(json);

  @override
  @JsonKey(name: '_id')
  final Map<String, String> dataBaseId;
  @JsonKey(defaultValue: "Buffalo")
  @override
  final String cattleType;
  @override
  final int cattleNumber;
  @override
  final int milkQuantity;
  @override
  @JsonKey(name: 'date', fromJson: MilkingEntry._fromJson)
  final DateTime dateTime;
  @JsonKey(defaultValue: "Manish Samaiya")
  @override
  final String milker;

  @override
  String toString() {
    return 'MilkingEntry(dataBaseId: $dataBaseId, cattleType: $cattleType, cattleNumber: $cattleNumber, milkQuantity: $milkQuantity, dateTime: $dateTime, milker: $milker)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MilkingEntry &&
            (identical(other.dataBaseId, dataBaseId) ||
                const DeepCollectionEquality()
                    .equals(other.dataBaseId, dataBaseId)) &&
            (identical(other.cattleType, cattleType) ||
                const DeepCollectionEquality()
                    .equals(other.cattleType, cattleType)) &&
            (identical(other.cattleNumber, cattleNumber) ||
                const DeepCollectionEquality()
                    .equals(other.cattleNumber, cattleNumber)) &&
            (identical(other.milkQuantity, milkQuantity) ||
                const DeepCollectionEquality()
                    .equals(other.milkQuantity, milkQuantity)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.milker, milker) ||
                const DeepCollectionEquality().equals(other.milker, milker)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dataBaseId) ^
      const DeepCollectionEquality().hash(cattleType) ^
      const DeepCollectionEquality().hash(cattleNumber) ^
      const DeepCollectionEquality().hash(milkQuantity) ^
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(milker);

  @JsonKey(ignore: true)
  @override
  _$MilkingEntryCopyWith<_MilkingEntry> get copyWith =>
      __$MilkingEntryCopyWithImpl<_MilkingEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MilkingEntryToJson(this);
  }
}

abstract class _MilkingEntry implements MilkingEntry {
  const factory _MilkingEntry(
      [@JsonKey(name: '_id')
          Map<String, String> dataBaseId,
      String cattleType,
      int cattleNumber,
      int milkQuantity,
      @JsonKey(name: 'date', fromJson: MilkingEntry._fromJson)
          DateTime dateTime,
      String milker]) = _$_MilkingEntry;

  factory _MilkingEntry.fromJson(Map<String, dynamic> json) =
      _$_MilkingEntry.fromJson;

  @override
  @JsonKey(name: '_id')
  Map<String, String> get dataBaseId;
  @override
  String get cattleType;
  @override
  int get cattleNumber;
  @override
  int get milkQuantity;
  @override
  @JsonKey(name: 'date', fromJson: MilkingEntry._fromJson)
  DateTime get dateTime;
  @override
  String get milker;
  @override
  @JsonKey(ignore: true)
  _$MilkingEntryCopyWith<_MilkingEntry> get copyWith;
}

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
      [String cattleType = "Buffalo",
      int cattleNumber = 1,
      double milkQuantity = 0.0,
      String milker = "Manish Samaiya"]) {
    return _MilkingEntry(
      cattleType,
      cattleNumber,
      milkQuantity,
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
  String get cattleType;
  int get cattleNumber;
  double get milkQuantity;
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
      {String cattleType,
      int cattleNumber,
      double milkQuantity,
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
    Object cattleType = freezed,
    Object cattleNumber = freezed,
    Object milkQuantity = freezed,
    Object milker = freezed,
  }) {
    return _then(_value.copyWith(
      cattleType:
          cattleType == freezed ? _value.cattleType : cattleType as String,
      cattleNumber:
          cattleNumber == freezed ? _value.cattleNumber : cattleNumber as int,
      milkQuantity: milkQuantity == freezed
          ? _value.milkQuantity
          : milkQuantity as double,
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
      {String cattleType,
      int cattleNumber,
      double milkQuantity,
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
    Object cattleType = freezed,
    Object cattleNumber = freezed,
    Object milkQuantity = freezed,
    Object milker = freezed,
  }) {
    return _then(_MilkingEntry(
      cattleType == freezed ? _value.cattleType : cattleType as String,
      cattleNumber == freezed ? _value.cattleNumber : cattleNumber as int,
      milkQuantity == freezed ? _value.milkQuantity : milkQuantity as double,
      milker == freezed ? _value.milker : milker as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_MilkingEntry implements _MilkingEntry {
  const _$_MilkingEntry(
      [this.cattleType = "Buffalo",
      this.cattleNumber = 1,
      this.milkQuantity = 0.0,
      this.milker = "Manish Samaiya"])
      : assert(cattleType != null),
        assert(cattleNumber != null),
        assert(milkQuantity != null),
        assert(milker != null);

  factory _$_MilkingEntry.fromJson(Map<String, dynamic> json) =>
      _$_$_MilkingEntryFromJson(json);

  @JsonKey(defaultValue: "Buffalo")
  @override
  final String cattleType;
  @JsonKey(defaultValue: 1)
  @override
  final int cattleNumber;
  @JsonKey(defaultValue: 0.0)
  @override
  final double milkQuantity;
  @JsonKey(defaultValue: "Manish Samaiya")
  @override
  final String milker;

  @override
  String toString() {
    return 'MilkingEntry(cattleType: $cattleType, cattleNumber: $cattleNumber, milkQuantity: $milkQuantity, milker: $milker)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MilkingEntry &&
            (identical(other.cattleType, cattleType) ||
                const DeepCollectionEquality()
                    .equals(other.cattleType, cattleType)) &&
            (identical(other.cattleNumber, cattleNumber) ||
                const DeepCollectionEquality()
                    .equals(other.cattleNumber, cattleNumber)) &&
            (identical(other.milkQuantity, milkQuantity) ||
                const DeepCollectionEquality()
                    .equals(other.milkQuantity, milkQuantity)) &&
            (identical(other.milker, milker) ||
                const DeepCollectionEquality().equals(other.milker, milker)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cattleType) ^
      const DeepCollectionEquality().hash(cattleNumber) ^
      const DeepCollectionEquality().hash(milkQuantity) ^
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
      [String cattleType,
      int cattleNumber,
      double milkQuantity,
      String milker]) = _$_MilkingEntry;

  factory _MilkingEntry.fromJson(Map<String, dynamic> json) =
      _$_MilkingEntry.fromJson;

  @override
  String get cattleType;
  @override
  int get cattleNumber;
  @override
  double get milkQuantity;
  @override
  String get milker;
  @override
  @JsonKey(ignore: true)
  _$MilkingEntryCopyWith<_MilkingEntry> get copyWith;
}
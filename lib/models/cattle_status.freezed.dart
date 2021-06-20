// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'cattle_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CattleStatus _$CattleStatusFromJson(Map<String, dynamic> json) {
  return _CattleStatus.fromJson(json);
}

/// @nodoc
class _$CattleStatusTearOff {
  const _$CattleStatusTearOff();

// ignore: unused_element
  _CattleStatus call(
      [CattleStatusEnum status,
      DateTime changed_on,
      @JsonKey(name: '_id') Map<String, String> dataBaseId,
      String lastModifiedBy]) {
    return _CattleStatus(
      status,
      changed_on,
      dataBaseId,
      lastModifiedBy,
    );
  }

// ignore: unused_element
  CattleStatus fromJson(Map<String, Object> json) {
    return CattleStatus.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CattleStatus = _$CattleStatusTearOff();

/// @nodoc
mixin _$CattleStatus {
  CattleStatusEnum get status;
  DateTime get changed_on;
  @JsonKey(name: '_id')
  Map<String, String> get dataBaseId;
  String get lastModifiedBy;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $CattleStatusCopyWith<CattleStatus> get copyWith;
}

/// @nodoc
abstract class $CattleStatusCopyWith<$Res> {
  factory $CattleStatusCopyWith(
          CattleStatus value, $Res Function(CattleStatus) then) =
      _$CattleStatusCopyWithImpl<$Res>;
  $Res call(
      {CattleStatusEnum status,
      DateTime changed_on,
      @JsonKey(name: '_id') Map<String, String> dataBaseId,
      String lastModifiedBy});
}

/// @nodoc
class _$CattleStatusCopyWithImpl<$Res> implements $CattleStatusCopyWith<$Res> {
  _$CattleStatusCopyWithImpl(this._value, this._then);

  final CattleStatus _value;
  // ignore: unused_field
  final $Res Function(CattleStatus) _then;

  @override
  $Res call({
    Object status = freezed,
    Object changed_on = freezed,
    Object dataBaseId = freezed,
    Object lastModifiedBy = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed ? _value.status : status as CattleStatusEnum,
      changed_on:
          changed_on == freezed ? _value.changed_on : changed_on as DateTime,
      dataBaseId: dataBaseId == freezed
          ? _value.dataBaseId
          : dataBaseId as Map<String, String>,
      lastModifiedBy: lastModifiedBy == freezed
          ? _value.lastModifiedBy
          : lastModifiedBy as String,
    ));
  }
}

/// @nodoc
abstract class _$CattleStatusCopyWith<$Res>
    implements $CattleStatusCopyWith<$Res> {
  factory _$CattleStatusCopyWith(
          _CattleStatus value, $Res Function(_CattleStatus) then) =
      __$CattleStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {CattleStatusEnum status,
      DateTime changed_on,
      @JsonKey(name: '_id') Map<String, String> dataBaseId,
      String lastModifiedBy});
}

/// @nodoc
class __$CattleStatusCopyWithImpl<$Res> extends _$CattleStatusCopyWithImpl<$Res>
    implements _$CattleStatusCopyWith<$Res> {
  __$CattleStatusCopyWithImpl(
      _CattleStatus _value, $Res Function(_CattleStatus) _then)
      : super(_value, (v) => _then(v as _CattleStatus));

  @override
  _CattleStatus get _value => super._value as _CattleStatus;

  @override
  $Res call({
    Object status = freezed,
    Object changed_on = freezed,
    Object dataBaseId = freezed,
    Object lastModifiedBy = freezed,
  }) {
    return _then(_CattleStatus(
      status == freezed ? _value.status : status as CattleStatusEnum,
      changed_on == freezed ? _value.changed_on : changed_on as DateTime,
      dataBaseId == freezed
          ? _value.dataBaseId
          : dataBaseId as Map<String, String>,
      lastModifiedBy == freezed
          ? _value.lastModifiedBy
          : lastModifiedBy as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CattleStatus implements _CattleStatus {
  const _$_CattleStatus(
      [this.status,
      this.changed_on,
      @JsonKey(name: '_id') this.dataBaseId,
      this.lastModifiedBy]);

  factory _$_CattleStatus.fromJson(Map<String, dynamic> json) =>
      _$_$_CattleStatusFromJson(json);

  @override
  final CattleStatusEnum status;
  @override
  final DateTime changed_on;
  @override
  @JsonKey(name: '_id')
  final Map<String, String> dataBaseId;
  @override
  final String lastModifiedBy;

  @override
  String toString() {
    return 'CattleStatus(status: $status, changed_on: $changed_on, dataBaseId: $dataBaseId, lastModifiedBy: $lastModifiedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CattleStatus &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.changed_on, changed_on) ||
                const DeepCollectionEquality()
                    .equals(other.changed_on, changed_on)) &&
            (identical(other.dataBaseId, dataBaseId) ||
                const DeepCollectionEquality()
                    .equals(other.dataBaseId, dataBaseId)) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedBy, lastModifiedBy)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(changed_on) ^
      const DeepCollectionEquality().hash(dataBaseId) ^
      const DeepCollectionEquality().hash(lastModifiedBy);

  @JsonKey(ignore: true)
  @override
  _$CattleStatusCopyWith<_CattleStatus> get copyWith =>
      __$CattleStatusCopyWithImpl<_CattleStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CattleStatusToJson(this);
  }
}

abstract class _CattleStatus implements CattleStatus {
  const factory _CattleStatus(
      [CattleStatusEnum status,
      DateTime changed_on,
      @JsonKey(name: '_id') Map<String, String> dataBaseId,
      String lastModifiedBy]) = _$_CattleStatus;

  factory _CattleStatus.fromJson(Map<String, dynamic> json) =
      _$_CattleStatus.fromJson;

  @override
  CattleStatusEnum get status;
  @override
  DateTime get changed_on;
  @override
  @JsonKey(name: '_id')
  Map<String, String> get dataBaseId;
  @override
  String get lastModifiedBy;
  @override
  @JsonKey(ignore: true)
  _$CattleStatusCopyWith<_CattleStatus> get copyWith;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'dairy_farm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DairyFarm _$DairyFarmFromJson(Map<String, dynamic> json) {
  return _DairyFarm.fromJson(json);
}

/// @nodoc
class _$DairyFarmTearOff {
  const _$DairyFarmTearOff();

// ignore: unused_element
  _DairyFarm call(
      [@JsonKey(name: '_id') String id,
      String name,
      String ownerName,
      String location,
      String state]) {
    return _DairyFarm(
      id,
      name,
      ownerName,
      location,
      state,
    );
  }

// ignore: unused_element
  DairyFarm fromJson(Map<String, Object> json) {
    return DairyFarm.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DairyFarm = _$DairyFarmTearOff();

/// @nodoc
mixin _$DairyFarm {
  @JsonKey(name: '_id')
  String get id;
  String get name;
  String get ownerName;
  String get location;
  String get state;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DairyFarmCopyWith<DairyFarm> get copyWith;
}

/// @nodoc
abstract class $DairyFarmCopyWith<$Res> {
  factory $DairyFarmCopyWith(DairyFarm value, $Res Function(DairyFarm) then) =
      _$DairyFarmCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String ownerName,
      String location,
      String state});
}

/// @nodoc
class _$DairyFarmCopyWithImpl<$Res> implements $DairyFarmCopyWith<$Res> {
  _$DairyFarmCopyWithImpl(this._value, this._then);

  final DairyFarm _value;
  // ignore: unused_field
  final $Res Function(DairyFarm) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object ownerName = freezed,
    Object location = freezed,
    Object state = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      ownerName: ownerName == freezed ? _value.ownerName : ownerName as String,
      location: location == freezed ? _value.location : location as String,
      state: state == freezed ? _value.state : state as String,
    ));
  }
}

/// @nodoc
abstract class _$DairyFarmCopyWith<$Res> implements $DairyFarmCopyWith<$Res> {
  factory _$DairyFarmCopyWith(
          _DairyFarm value, $Res Function(_DairyFarm) then) =
      __$DairyFarmCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String ownerName,
      String location,
      String state});
}

/// @nodoc
class __$DairyFarmCopyWithImpl<$Res> extends _$DairyFarmCopyWithImpl<$Res>
    implements _$DairyFarmCopyWith<$Res> {
  __$DairyFarmCopyWithImpl(_DairyFarm _value, $Res Function(_DairyFarm) _then)
      : super(_value, (v) => _then(v as _DairyFarm));

  @override
  _DairyFarm get _value => super._value as _DairyFarm;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object ownerName = freezed,
    Object location = freezed,
    Object state = freezed,
  }) {
    return _then(_DairyFarm(
      id == freezed ? _value.id : id as String,
      name == freezed ? _value.name : name as String,
      ownerName == freezed ? _value.ownerName : ownerName as String,
      location == freezed ? _value.location : location as String,
      state == freezed ? _value.state : state as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DairyFarm implements _DairyFarm {
  const _$_DairyFarm(
      [@JsonKey(name: '_id') this.id,
      this.name,
      this.ownerName,
      this.location,
      this.state]);

  factory _$_DairyFarm.fromJson(Map<String, dynamic> json) =>
      _$_$_DairyFarmFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String ownerName;
  @override
  final String location;
  @override
  final String state;

  @override
  String toString() {
    return 'DairyFarm(id: $id, name: $name, ownerName: $ownerName, location: $location, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DairyFarm &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.ownerName, ownerName) ||
                const DeepCollectionEquality()
                    .equals(other.ownerName, ownerName)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(ownerName) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(state);

  @JsonKey(ignore: true)
  @override
  _$DairyFarmCopyWith<_DairyFarm> get copyWith =>
      __$DairyFarmCopyWithImpl<_DairyFarm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DairyFarmToJson(this);
  }
}

abstract class _DairyFarm implements DairyFarm {
  const factory _DairyFarm(
      [@JsonKey(name: '_id') String id,
      String name,
      String ownerName,
      String location,
      String state]) = _$_DairyFarm;

  factory _DairyFarm.fromJson(Map<String, dynamic> json) =
      _$_DairyFarm.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get ownerName;
  @override
  String get location;
  @override
  String get state;
  @override
  @JsonKey(ignore: true)
  _$DairyFarmCopyWith<_DairyFarm> get copyWith;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'milker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Milker _$MilkerFromJson(Map<String, dynamic> json) {
  return _Milker.fromJson(json);
}

/// @nodoc
class _$MilkerTearOff {
  const _$MilkerTearOff();

// ignore: unused_element
  _Milker call(
      [@JsonKey(name: '_id') String id,
      String name,
      String contact,
      String address]) {
    return _Milker(
      id,
      name,
      contact,
      address,
    );
  }

// ignore: unused_element
  Milker fromJson(Map<String, Object> json) {
    return Milker.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Milker = _$MilkerTearOff();

/// @nodoc
mixin _$Milker {
  @JsonKey(name: '_id')
  String get id;
  String get name;
  String get contact;
  String get address;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $MilkerCopyWith<Milker> get copyWith;
}

/// @nodoc
abstract class $MilkerCopyWith<$Res> {
  factory $MilkerCopyWith(Milker value, $Res Function(Milker) then) =
      _$MilkerCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String contact,
      String address});
}

/// @nodoc
class _$MilkerCopyWithImpl<$Res> implements $MilkerCopyWith<$Res> {
  _$MilkerCopyWithImpl(this._value, this._then);

  final Milker _value;
  // ignore: unused_field
  final $Res Function(Milker) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object contact = freezed,
    Object address = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      contact: contact == freezed ? _value.contact : contact as String,
      address: address == freezed ? _value.address : address as String,
    ));
  }
}

/// @nodoc
abstract class _$MilkerCopyWith<$Res> implements $MilkerCopyWith<$Res> {
  factory _$MilkerCopyWith(_Milker value, $Res Function(_Milker) then) =
      __$MilkerCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String contact,
      String address});
}

/// @nodoc
class __$MilkerCopyWithImpl<$Res> extends _$MilkerCopyWithImpl<$Res>
    implements _$MilkerCopyWith<$Res> {
  __$MilkerCopyWithImpl(_Milker _value, $Res Function(_Milker) _then)
      : super(_value, (v) => _then(v as _Milker));

  @override
  _Milker get _value => super._value as _Milker;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object contact = freezed,
    Object address = freezed,
  }) {
    return _then(_Milker(
      id == freezed ? _value.id : id as String,
      name == freezed ? _value.name : name as String,
      contact == freezed ? _value.contact : contact as String,
      address == freezed ? _value.address : address as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Milker implements _Milker {
  const _$_Milker(
      [@JsonKey(name: '_id') this.id, this.name, this.contact, this.address]);

  factory _$_Milker.fromJson(Map<String, dynamic> json) =>
      _$_$_MilkerFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String contact;
  @override
  final String address;

  @override
  String toString() {
    return 'Milker(id: $id, name: $name, contact: $contact, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Milker &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.contact, contact) ||
                const DeepCollectionEquality()
                    .equals(other.contact, contact)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality().equals(other.address, address)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(contact) ^
      const DeepCollectionEquality().hash(address);

  @JsonKey(ignore: true)
  @override
  _$MilkerCopyWith<_Milker> get copyWith =>
      __$MilkerCopyWithImpl<_Milker>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MilkerToJson(this);
  }
}

abstract class _Milker implements Milker {
  const factory _Milker(
      [@JsonKey(name: '_id') String id,
      String name,
      String contact,
      String address]) = _$_Milker;

  factory _Milker.fromJson(Map<String, dynamic> json) = _$_Milker.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get contact;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$MilkerCopyWith<_Milker> get copyWith;
}

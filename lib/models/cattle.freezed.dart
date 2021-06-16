// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'cattle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CattleEntry _$CattleEntryFromJson(Map<String, dynamic> json) {
  return _CattleEntry.fromJson(json);
}

/// @nodoc
class _$CattleEntryTearOff {
  const _$CattleEntryTearOff();

// ignore: unused_element
  _CattleEntry call(
      [@JsonKey(name: '_id') Map<String, String> dataBaseId,
      String tagNumber,
      CattleType type,
      CattleGender gender,
      DairyFarm boughtFrom,
      int price,
      int age,
      int childrenCount,
      int numberOfTeeth,
      String breed,
      double milkPromised,
      DateTime broughtInDate,
      bool isSold = false,
      bool isDead = false]) {
    return _CattleEntry(
      dataBaseId,
      tagNumber,
      type,
      gender,
      boughtFrom,
      price,
      age,
      childrenCount,
      numberOfTeeth,
      breed,
      milkPromised,
      broughtInDate,
      isSold,
      isDead,
    );
  }

// ignore: unused_element
  CattleEntry fromJson(Map<String, Object> json) {
    return CattleEntry.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CattleEntry = _$CattleEntryTearOff();

/// @nodoc
mixin _$CattleEntry {
  @JsonKey(name: '_id')
  Map<String, String> get dataBaseId;
  String get tagNumber;
  CattleType get type;
  CattleGender get gender;
  DairyFarm get boughtFrom;
  int get price;
  int get age;
  int get childrenCount;
  int get numberOfTeeth;
  String get breed;
  double get milkPromised;
  DateTime get broughtInDate;
  bool get isSold;
  bool get isDead;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $CattleEntryCopyWith<CattleEntry> get copyWith;
}

/// @nodoc
abstract class $CattleEntryCopyWith<$Res> {
  factory $CattleEntryCopyWith(
          CattleEntry value, $Res Function(CattleEntry) then) =
      _$CattleEntryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') Map<String, String> dataBaseId,
      String tagNumber,
      CattleType type,
      CattleGender gender,
      DairyFarm boughtFrom,
      int price,
      int age,
      int childrenCount,
      int numberOfTeeth,
      String breed,
      double milkPromised,
      DateTime broughtInDate,
      bool isSold,
      bool isDead});

  $DairyFarmCopyWith<$Res> get boughtFrom;
}

/// @nodoc
class _$CattleEntryCopyWithImpl<$Res> implements $CattleEntryCopyWith<$Res> {
  _$CattleEntryCopyWithImpl(this._value, this._then);

  final CattleEntry _value;
  // ignore: unused_field
  final $Res Function(CattleEntry) _then;

  @override
  $Res call({
    Object dataBaseId = freezed,
    Object tagNumber = freezed,
    Object type = freezed,
    Object gender = freezed,
    Object boughtFrom = freezed,
    Object price = freezed,
    Object age = freezed,
    Object childrenCount = freezed,
    Object numberOfTeeth = freezed,
    Object breed = freezed,
    Object milkPromised = freezed,
    Object broughtInDate = freezed,
    Object isSold = freezed,
    Object isDead = freezed,
  }) {
    return _then(_value.copyWith(
      dataBaseId: dataBaseId == freezed
          ? _value.dataBaseId
          : dataBaseId as Map<String, String>,
      tagNumber: tagNumber == freezed ? _value.tagNumber : tagNumber as String,
      type: type == freezed ? _value.type : type as CattleType,
      gender: gender == freezed ? _value.gender : gender as CattleGender,
      boughtFrom:
          boughtFrom == freezed ? _value.boughtFrom : boughtFrom as DairyFarm,
      price: price == freezed ? _value.price : price as int,
      age: age == freezed ? _value.age : age as int,
      childrenCount: childrenCount == freezed
          ? _value.childrenCount
          : childrenCount as int,
      numberOfTeeth: numberOfTeeth == freezed
          ? _value.numberOfTeeth
          : numberOfTeeth as int,
      breed: breed == freezed ? _value.breed : breed as String,
      milkPromised: milkPromised == freezed
          ? _value.milkPromised
          : milkPromised as double,
      broughtInDate: broughtInDate == freezed
          ? _value.broughtInDate
          : broughtInDate as DateTime,
      isSold: isSold == freezed ? _value.isSold : isSold as bool,
      isDead: isDead == freezed ? _value.isDead : isDead as bool,
    ));
  }

  @override
  $DairyFarmCopyWith<$Res> get boughtFrom {
    if (_value.boughtFrom == null) {
      return null;
    }
    return $DairyFarmCopyWith<$Res>(_value.boughtFrom, (value) {
      return _then(_value.copyWith(boughtFrom: value));
    });
  }
}

/// @nodoc
abstract class _$CattleEntryCopyWith<$Res>
    implements $CattleEntryCopyWith<$Res> {
  factory _$CattleEntryCopyWith(
          _CattleEntry value, $Res Function(_CattleEntry) then) =
      __$CattleEntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') Map<String, String> dataBaseId,
      String tagNumber,
      CattleType type,
      CattleGender gender,
      DairyFarm boughtFrom,
      int price,
      int age,
      int childrenCount,
      int numberOfTeeth,
      String breed,
      double milkPromised,
      DateTime broughtInDate,
      bool isSold,
      bool isDead});

  @override
  $DairyFarmCopyWith<$Res> get boughtFrom;
}

/// @nodoc
class __$CattleEntryCopyWithImpl<$Res> extends _$CattleEntryCopyWithImpl<$Res>
    implements _$CattleEntryCopyWith<$Res> {
  __$CattleEntryCopyWithImpl(
      _CattleEntry _value, $Res Function(_CattleEntry) _then)
      : super(_value, (v) => _then(v as _CattleEntry));

  @override
  _CattleEntry get _value => super._value as _CattleEntry;

  @override
  $Res call({
    Object dataBaseId = freezed,
    Object tagNumber = freezed,
    Object type = freezed,
    Object gender = freezed,
    Object boughtFrom = freezed,
    Object price = freezed,
    Object age = freezed,
    Object childrenCount = freezed,
    Object numberOfTeeth = freezed,
    Object breed = freezed,
    Object milkPromised = freezed,
    Object broughtInDate = freezed,
    Object isSold = freezed,
    Object isDead = freezed,
  }) {
    return _then(_CattleEntry(
      dataBaseId == freezed
          ? _value.dataBaseId
          : dataBaseId as Map<String, String>,
      tagNumber == freezed ? _value.tagNumber : tagNumber as String,
      type == freezed ? _value.type : type as CattleType,
      gender == freezed ? _value.gender : gender as CattleGender,
      boughtFrom == freezed ? _value.boughtFrom : boughtFrom as DairyFarm,
      price == freezed ? _value.price : price as int,
      age == freezed ? _value.age : age as int,
      childrenCount == freezed ? _value.childrenCount : childrenCount as int,
      numberOfTeeth == freezed ? _value.numberOfTeeth : numberOfTeeth as int,
      breed == freezed ? _value.breed : breed as String,
      milkPromised == freezed ? _value.milkPromised : milkPromised as double,
      broughtInDate == freezed
          ? _value.broughtInDate
          : broughtInDate as DateTime,
      isSold == freezed ? _value.isSold : isSold as bool,
      isDead == freezed ? _value.isDead : isDead as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CattleEntry implements _CattleEntry {
  const _$_CattleEntry(
      [@JsonKey(name: '_id') this.dataBaseId,
      this.tagNumber,
      this.type,
      this.gender,
      this.boughtFrom,
      this.price,
      this.age,
      this.childrenCount,
      this.numberOfTeeth,
      this.breed,
      this.milkPromised,
      this.broughtInDate,
      this.isSold = false,
      this.isDead = false])
      : assert(isSold != null),
        assert(isDead != null);

  factory _$_CattleEntry.fromJson(Map<String, dynamic> json) =>
      _$_$_CattleEntryFromJson(json);

  @override
  @JsonKey(name: '_id')
  final Map<String, String> dataBaseId;
  @override
  final String tagNumber;
  @override
  final CattleType type;
  @override
  final CattleGender gender;
  @override
  final DairyFarm boughtFrom;
  @override
  final int price;
  @override
  final int age;
  @override
  final int childrenCount;
  @override
  final int numberOfTeeth;
  @override
  final String breed;
  @override
  final double milkPromised;
  @override
  final DateTime broughtInDate;
  @JsonKey(defaultValue: false)
  @override
  final bool isSold;
  @JsonKey(defaultValue: false)
  @override
  final bool isDead;

  @override
  String toString() {
    return 'CattleEntry(dataBaseId: $dataBaseId, tagNumber: $tagNumber, type: $type, gender: $gender, boughtFrom: $boughtFrom, price: $price, age: $age, childrenCount: $childrenCount, numberOfTeeth: $numberOfTeeth, breed: $breed, milkPromised: $milkPromised, broughtInDate: $broughtInDate, isSold: $isSold, isDead: $isDead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CattleEntry &&
            (identical(other.dataBaseId, dataBaseId) ||
                const DeepCollectionEquality()
                    .equals(other.dataBaseId, dataBaseId)) &&
            (identical(other.tagNumber, tagNumber) ||
                const DeepCollectionEquality()
                    .equals(other.tagNumber, tagNumber)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.boughtFrom, boughtFrom) ||
                const DeepCollectionEquality()
                    .equals(other.boughtFrom, boughtFrom)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.childrenCount, childrenCount) ||
                const DeepCollectionEquality()
                    .equals(other.childrenCount, childrenCount)) &&
            (identical(other.numberOfTeeth, numberOfTeeth) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfTeeth, numberOfTeeth)) &&
            (identical(other.breed, breed) ||
                const DeepCollectionEquality().equals(other.breed, breed)) &&
            (identical(other.milkPromised, milkPromised) ||
                const DeepCollectionEquality()
                    .equals(other.milkPromised, milkPromised)) &&
            (identical(other.broughtInDate, broughtInDate) ||
                const DeepCollectionEquality()
                    .equals(other.broughtInDate, broughtInDate)) &&
            (identical(other.isSold, isSold) ||
                const DeepCollectionEquality().equals(other.isSold, isSold)) &&
            (identical(other.isDead, isDead) ||
                const DeepCollectionEquality().equals(other.isDead, isDead)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dataBaseId) ^
      const DeepCollectionEquality().hash(tagNumber) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(boughtFrom) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(childrenCount) ^
      const DeepCollectionEquality().hash(numberOfTeeth) ^
      const DeepCollectionEquality().hash(breed) ^
      const DeepCollectionEquality().hash(milkPromised) ^
      const DeepCollectionEquality().hash(broughtInDate) ^
      const DeepCollectionEquality().hash(isSold) ^
      const DeepCollectionEquality().hash(isDead);

  @JsonKey(ignore: true)
  @override
  _$CattleEntryCopyWith<_CattleEntry> get copyWith =>
      __$CattleEntryCopyWithImpl<_CattleEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CattleEntryToJson(this);
  }
}

abstract class _CattleEntry implements CattleEntry {
  const factory _CattleEntry(
      [@JsonKey(name: '_id') Map<String, String> dataBaseId,
      String tagNumber,
      CattleType type,
      CattleGender gender,
      DairyFarm boughtFrom,
      int price,
      int age,
      int childrenCount,
      int numberOfTeeth,
      String breed,
      double milkPromised,
      DateTime broughtInDate,
      bool isSold,
      bool isDead]) = _$_CattleEntry;

  factory _CattleEntry.fromJson(Map<String, dynamic> json) =
      _$_CattleEntry.fromJson;

  @override
  @JsonKey(name: '_id')
  Map<String, String> get dataBaseId;
  @override
  String get tagNumber;
  @override
  CattleType get type;
  @override
  CattleGender get gender;
  @override
  DairyFarm get boughtFrom;
  @override
  int get price;
  @override
  int get age;
  @override
  int get childrenCount;
  @override
  int get numberOfTeeth;
  @override
  String get breed;
  @override
  double get milkPromised;
  @override
  DateTime get broughtInDate;
  @override
  bool get isSold;
  @override
  bool get isDead;
  @override
  @JsonKey(ignore: true)
  _$CattleEntryCopyWith<_CattleEntry> get copyWith;
}

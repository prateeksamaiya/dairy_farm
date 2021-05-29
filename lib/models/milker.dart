import 'package:freezed_annotation/freezed_annotation.dart';

part 'milker.freezed.dart';
part 'milker.g.dart';

@freezed
abstract class Milker with _$Milker {
  const factory Milker(
    [ @JsonKey(name:'_id') String id,
    String name,
    String contact,
    String address,
    ]) = _Milker;

  factory Milker.fromJson(Map<String, dynamic> json) => _$MilkerFromJson(json);
}

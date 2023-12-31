import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required String id,
    required String fullName,
    required String destination,
    required bool isReserved,
    int? turn
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json)
      => _$PersonFromJson(json);
}
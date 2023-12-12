// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      destination: json['destination'] as String,
      isReserved: json['isReserved'] as bool,
      turn: json['turn'] as int?,
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'destination': instance.destination,
      'isReserved': instance.isReserved,
      'turn': instance.turn,
    };

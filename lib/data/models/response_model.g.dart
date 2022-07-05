// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel<T> _$ResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ResponseModel<T>(
      (json['results'] as List<dynamic>).map(fromJsonT).toList(),
      InfoModel.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseModelToJson<T>(
  ResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'results': instance.results.map(toJsonT).toList(),
      'info': instance.info,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) => InfoModel(
      json['count'] as int?,
      json['pages'] as int?,
      json['next'] as String?,
      json['prev'] as String?,
    );

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };

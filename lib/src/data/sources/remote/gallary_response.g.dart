// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GallaryResponse<T> _$GallaryResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    GallaryResponse<T>(
      success: json['success'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      hits: _$nullableGenericFromJson(json['hits'], fromJsonT),
      total: (json['total'] as num?)?.toInt(),
      totalHits: (json['totalHits'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GallaryResponseToJson<T>(
  GallaryResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'totalHits': instance.totalHits,
      'total': instance.total,
      'success': instance.success,
      'responseMessage': instance.responseMessage,
      'hits': _$nullableGenericToJson(instance.hits, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

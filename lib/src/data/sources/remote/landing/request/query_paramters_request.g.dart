// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_paramters_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryParametersRequest _$QueryParametersRequestFromJson(
        Map<String, dynamic> json) =>
    QueryParametersRequest(
      imageType: json['image_type'] as String,
      q: json['q'] as String,
      perPage: (json['per_page'] as num).toInt(),
      key: json['key'] as String,
    );

Map<String, dynamic> _$QueryParametersRequestToJson(
        QueryParametersRequest instance) =>
    <String, dynamic>{
      'image_type': instance.imageType,
      'per_page': instance.perPage,
      'q': instance.q,
      'key': instance.key,
    };

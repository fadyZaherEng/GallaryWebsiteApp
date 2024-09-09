import 'package:json_annotation/json_annotation.dart';

part 'query_paramters_request.g.dart';

@JsonSerializable()
class QueryParametersRequest {
  // for this parameters:
  @JsonKey(name: 'image_type')
  String imageType;
  @JsonKey(name: 'per_page')
  int perPage;
  @JsonKey(name: 'q')
  String q;
  @JsonKey(name: "key")
  String key;

  QueryParametersRequest({
    required this.imageType,
    required this.q,
    required this.perPage,
    required this.key,
  });

  factory QueryParametersRequest.fromJson(Map<String, dynamic> json) =>
      _$QueryParametersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$QueryParametersRequestToJson(this);
}

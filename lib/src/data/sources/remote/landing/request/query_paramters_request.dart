import 'package:json_annotation/json_annotation.dart';

part 'query_paramters_request.g.dart';

@JsonSerializable()
class QueryParametersRequest {
  // for this parameters:
  @JsonKey(name: 'image_type')
  String imageType;
  @JsonKey(name: 'per_page')
  int perPage;
  @JsonKey(name: 'page')
  int page;
  @JsonKey(name: 'q')
  String? q;
  @JsonKey(name: "key")
  String key;

  QueryParametersRequest({
    required this.imageType,
    this.q,
    required this.perPage,
    required this.key,
    required this.page,
  });

  factory QueryParametersRequest.fromJson(Map<String, dynamic> json) =>
      _$QueryParametersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$QueryParametersRequestToJson(this);
}

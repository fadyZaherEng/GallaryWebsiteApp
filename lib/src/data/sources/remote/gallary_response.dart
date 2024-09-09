import 'package:json_annotation/json_annotation.dart';

part 'gallary_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GallaryResponse<T> {
  @JsonKey(name: 'totalHits')
  int? totalHits;
  @JsonKey(name: 'total')
  int? total;
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'responseMessage')
  String? responseMessage;
  @JsonKey(name: 'hits')
  T? hits;

  GallaryResponse({
    this.success,
    this.responseMessage,
    this.hits,
    this.total,
    this.totalHits,
  });

  factory GallaryResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$GallaryResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$GallaryResponseToJson(this, (T) {
        return T;
      });
}

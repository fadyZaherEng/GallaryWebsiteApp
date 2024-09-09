import 'package:json_annotation/json_annotation.dart';

part 'gallary_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GallaryRequest<T> {
  @JsonKey(name: 'data')
  T? data;

  GallaryRequest({
    this.data,
  });

  factory GallaryRequest.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$GallaryRequestFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$GallaryRequestToJson(this, (T) {
        return T;
      });

  GallaryRequest<T> createRequest(T) {
    return GallaryRequest(
      data: T,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data != null ? data : null,
    };
  }

  factory GallaryRequest.fromMap(Map<String, dynamic> map) {
    return GallaryRequest(
      data: map['data'] as T,
    );
  }


}

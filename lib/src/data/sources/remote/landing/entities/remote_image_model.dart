import 'dart:convert';

import 'package:gallary_website_app/src/domain/entities/gallary.dart';
import 'package:gallary_website_app/src/presentation/widgets/images_widget.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_image_model.g.dart';

@JsonSerializable()
class RemoteImageModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'pageURL')
  final String? pageURL;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'tags')
  final String? tags;
  @JsonKey(name: 'previewURL')
  final String? previewURL;
  @JsonKey(name: 'webformatURL')
  final String? webformatURL;
  @JsonKey(name: 'largeImageURL')
  final String? largeImageURL;
  @JsonKey(name: 'fullHDURL')
  final String? fullHDURL;
  @JsonKey(name: 'imageURL')
  final String? imageURL;
  @JsonKey(name: 'imageWidth')
  final int? imageWidth;
  @JsonKey(name: 'imageHeight')
  final int? imageHeight;
  @JsonKey(name: "imageSize")
  final int? imageSize;
  @JsonKey(name: "views")
  final int? views;
  @JsonKey(name: "downloads")
  final int? downloads;
  @JsonKey(name: "likes")
  final int? likes;
  @JsonKey(name: "comments")
  final int? comments;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'user')
  final String? user;
  @JsonKey(name: 'userImageURL')
  final String? userImageURL;

  const RemoteImageModel({
    this.id=0,
    this.pageURL='',
    this.type='',
    this.tags='',
    this.previewURL='',
    this.webformatURL='',
    this.largeImageURL='',
    this.fullHDURL='',
    this.imageURL='',
    this.imageWidth=0,
    this.imageHeight=0,
    this.imageSize=0,
    this.views=0,
    this.downloads=0,
    this.likes=0,
    this.comments=0,
    this.userId=0,
    this.user='',
    this.userImageURL='',
  });

  factory RemoteImageModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteImageModelToJson(this);
}
extension RemoteImageModelExtension on RemoteImageModel {
  ImageModel mapToImageModel() {
    return ImageModel(
    id: id??0,
    pageURL: pageURL??'',
    type: type??'',
    tags: tags??'',
    previewURL: previewURL??'',
    webformatURL: webformatURL??'',
    largeImageURL: largeImageURL??'',
    fullHDURL: fullHDURL??'',
    imageURL: imageURL??'',
    imageWidth: imageWidth??0,
    imageHeight: imageHeight??0,
    imageSize: imageSize??0,
    views: views??0,
    downloads: downloads??0,
    likes: likes??0,
    comments: comments??0,
    userId: userId??0,
    user: user??'',
    userImageURL: userImageURL??'',
    );
  }
}
extension RemoteImageModelListExtension on List<RemoteImageModel> {
  List<ImageModel> mapToImageModelList() {
    return map((e) => e.mapToImageModel()).toList();
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteImageModel _$RemoteImageModelFromJson(Map<String, dynamic> json) =>
    RemoteImageModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      pageURL: json['pageURL'] as String? ?? '',
      type: json['type'] as String? ?? '',
      tags: json['tags'] as String? ?? '',
      previewURL: json['previewURL'] as String? ?? '',
      webformatURL: json['webformatURL'] as String? ?? '',
      largeImageURL: json['largeImageURL'] as String? ?? '',
      fullHDURL: json['fullHDURL'] as String? ?? '',
      imageURL: json['imageURL'] as String? ?? '',
      imageWidth: (json['imageWidth'] as num?)?.toInt() ?? 0,
      imageHeight: (json['imageHeight'] as num?)?.toInt() ?? 0,
      imageSize: (json['imageSize'] as num?)?.toInt() ?? 0,
      views: (json['views'] as num?)?.toInt() ?? 0,
      downloads: (json['downloads'] as num?)?.toInt() ?? 0,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      comments: (json['comments'] as num?)?.toInt() ?? 0,
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      user: json['user'] as String? ?? '',
      userImageURL: json['userImageURL'] as String? ?? '',
    );

Map<String, dynamic> _$RemoteImageModelToJson(RemoteImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pageURL': instance.pageURL,
      'type': instance.type,
      'tags': instance.tags,
      'previewURL': instance.previewURL,
      'webformatURL': instance.webformatURL,
      'largeImageURL': instance.largeImageURL,
      'fullHDURL': instance.fullHDURL,
      'imageURL': instance.imageURL,
      'imageWidth': instance.imageWidth,
      'imageHeight': instance.imageHeight,
      'imageSize': instance.imageSize,
      'views': instance.views,
      'downloads': instance.downloads,
      'likes': instance.likes,
      'comments': instance.comments,
      'user_id': instance.userId,
      'user': instance.user,
      'userImageURL': instance.userImageURL,
    };

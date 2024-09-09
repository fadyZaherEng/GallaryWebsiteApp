class ImageModel {
  final String url;
  final String tags;
  final int views;
  final int likes;

  ImageModel({
    required this.likes,
    required this.tags,
    required this.url,
    required this.views,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      views: json['views'],
      likes: json['likes'],
      tags: json['tags'],
      url: json['webformatURL'],
    );
  }
}

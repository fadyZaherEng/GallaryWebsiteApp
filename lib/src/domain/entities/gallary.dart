class ImageModel {
  final int id;
  final String pageURL;
  final String type;
  final String tags;
  final String previewURL;
  final String webformatURL;
  final String largeImageURL;
  final String fullHDURL;
  final String imageURL;
  final int imageWidth;
  final int imageHeight;
  final int imageSize;
  final int views;
  final int downloads;
  final int likes;
  final int comments;
  final int userId;
  final String user;
  final String userImageURL;

  const ImageModel({
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

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      pageURL: json['pageURL'],
      type: json['type'],
      tags: json['tags'],
      previewURL: json['previewURL'],
      webformatURL: json['webformatURL'],
      largeImageURL: json['largeImageURL'],
      fullHDURL: json['fullHDURL'],
      imageURL: json['imageURL'],
      imageWidth: json['imageWidth'],
        imageHeight:json["imageHeight"],
      imageSize: json['imageSize'],
      views: json['views'],
      downloads: json['downloads'],
      likes: json['likes'],
      comments: json['comments'],
      userId: json['userId'],
      user: json['user'],
      userImageURL: json['userImageURL'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'pageURL': pageURL,
    'type': type,
    'tags': tags,
    'previewURL': previewURL,
    'webformatURL': webformatURL,
    'largeImageURL': largeImageURL,
    'fullHDURL': fullHDURL,
    'imageURL': imageURL,
    'imageWidth': imageWidth,
    'imageHeight': imageHeight,
    'imageSize': imageSize,
    "views": views,
    "downloads": downloads,
    "likes": likes,
    "comments": comments,
    "userId": userId,
    "user": user,
    "userImageURL": userImageURL,
  };
}

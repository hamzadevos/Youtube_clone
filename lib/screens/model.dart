class Video {
  final String thumbnail;
  final String title;
  final String channelName;
  final String views;
  final String uploadTime;

  Video({
    required this.thumbnail,
    required this.title,
    required this.channelName,
    required this.views,
    required this.uploadTime,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      thumbnail: json['thumbnail'],
      title: json['title'],
      channelName: json['channelName'],
      views: json['views'],
      uploadTime: json['uploadTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbnail': thumbnail,
      'title': title,
      'channelName': channelName,
      'views': views,
      'uploadTime': uploadTime,
    };
  }
}

// Short Model
class Short {
  final String thumbnail;
  final String title;
  final String details;

  Short({
    required this.thumbnail,
    required this.title,
    required this.details,
  });

  factory Short.fromJson(Map<String, dynamic> json) {
    return Short(
      thumbnail: json['thumbnail'],
      title: json['title'],
      details: json['details'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbnail': thumbnail,
      'title': title,
      'details': details,
    };
  }
}
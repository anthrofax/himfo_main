class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;
  // final String status;
  Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.channelTitle,
    // required this.status,
  });

  factory Video.fromMap(Map<String, dynamic> snippet) {
    return new Video(
      id: snippet['resourceId']['videoId'],
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']?['high']?['url'] == null
          ? "null"
          : snippet['thumbnails']['default']['url'],
      channelTitle: snippet['channelTitle'],
      // status: snippet['status']
    );
  }
}

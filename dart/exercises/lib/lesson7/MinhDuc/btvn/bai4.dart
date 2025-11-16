//Bài về nhà số 4: Danh sách video TikTok (ranking + stable sort + top-K theo bucket)
class tiktokVideo {
  String title;
  String creator;
  int likes;
  int views;
  int originalIndex;
  double get engagement => likes / (views == 0 ? 1 : views);
  tiktokVideo({required this.title, required this.creator, required this.likes, required this.views, required this.originalIndex});
  void showInfo() {
    print(
        'Tiêu đề: $title, Người tạo: $creator, Lượt thích: $likes, Lượt xem: $views, Chỉ số tương tác: $engagement');
  }
}
// Xếp hạng theo engagement ↓; nếu bằng nhau, ưu tiên views cao hơn. Nếu vẫn bằng nhau, giữ nguyên thứ tự ban đầu (stable sort).
void rankVideos(List<tiktokVideo> videos) {
  videos.sort((a, b) {
    int engagementComp = b.engagement.compareTo(a.engagement);
    if (engagementComp != 0) return engagementComp;
    int viewsComp = b.views.compareTo(a.views);
    if (viewsComp != 0) return viewsComp;
    return a.originalIndex.compareTo(b.originalIndex);
  });
}

// Lấy top-K video từ mỗi bucket lượt xem: <10k, 10k-100k, >100k. Lấy top 2 theo engagement trong mỗi bucket.
Map<String, List<tiktokVideo>> topKByViewBuckets(List<tiktokVideo> videos, int k) {
  var buckets = {
    '<10k': <tiktokVideo>[],
    '10k-100k': <tiktokVideo>[],
    '>100k': <tiktokVideo>[],
  };
  for (var video in videos) {
    if (video.views < 10000) {
      buckets['<10k']!.add(video);
    } else if (video.views <= 100000) {
      buckets['10k-100k']!.add(video);
    } else {
      buckets['>100k']!.add(video);
    }
  }
  var topKResults = <String, List<tiktokVideo>>{};
  buckets.forEach((key, bucketVideos) {
    bucketVideos.sort((a, b) => b.engagement.compareTo(a.engagement));
    topKResults[key] = bucketVideos.take(k).toList();
  });
  return topKResults;
}
// Tìm video có tiêu đề dài nhất và ngắn nhất, in kèm (views, likes, engagement).
void printTitleLengthExtremes(List<tiktokVideo> videos) {
  if (videos.isEmpty) return;
  var longest = videos.reduce((a, b) => a.title.length >= b.title.length ? a : b);
  var shortest = videos.reduce((a, b) => a.title.length <= b.title.length ? a : b);
  print('Video có tiêu đề dài nhất:');
  longest.showInfo();
  print('Video có tiêu đề ngắn nhất:');
  shortest.showInfo();
}
void main() {
  var videos = <tiktokVideo>[
    tiktokVideo(title: 'Dart Basics', creator: 'Alice', likes: 50000, views: 200000, originalIndex: 0),
    tiktokVideo(title: 'Flutter Tutorial', creator: 'Bob', likes: 1500, views: 5000, originalIndex: 1),
    tiktokVideo(title: 'Advanced Dart Programming', creator: 'Charlie', likes: 800, views: 3000, originalIndex: 2),
    tiktokVideo(title: 'Building Apps with Flutter', creator: 'Dave', likes: 2000, views: 10000, originalIndex: 3),
    tiktokVideo(title: 'Dart for Beginners', creator: 'Eve', likes: 300, views: 1500, originalIndex: 4),
    tiktokVideo(title: 'Flutter State Management', creator: 'Frank', likes: 1200, views: 8000, originalIndex: 5),
    tiktokVideo(title: 'Dart Collections', creator: 'Grace', likes: 2880, views: 100055, originalIndex: 6),
    tiktokVideo(title: 'Building Responsive UIs in Flutter', creator: 'Heidi', likes: 1800, views: 12000, originalIndex: 7),
    tiktokVideo(title: 'Dart Asynchronous Programming', creator: 'Ivan', likes: 600, views: 3500, originalIndex: 8),
    tiktokVideo(title: 'Flutter Animations', creator: 'Judy', likes: 22000, views: 150000, originalIndex: 9),
  ];

  rankVideos(videos);
  print('Danh sách video sau khi xếp hạng:');
  for (var video in videos) {
    video.showInfo();
  }

  var topKResults = topKByViewBuckets(videos, 2);
  print('\nTop-K video theo bucket lượt xem:');
  topKResults.forEach((bucket, topVideos) {
    print('Bucket $bucket:');
    for (var video in topVideos) {
      video.showInfo();
    }
  });

  print('\nTiêu đề dài nhất và ngắn nhất trong danh sách video:');
  printTitleLengthExtremes(videos);
}
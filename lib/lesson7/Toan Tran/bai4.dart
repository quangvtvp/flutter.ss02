//Bài 4: Danh sách video TikTok.//
import 'dart:io';

class TiktokVideo {
  String title;
  int views;
  int likes;
  int originalIndex;

  TiktokVideo(this.title, this.views, this.likes, this.originalIndex);

  double get engagement => likes / (views == 0 ? 1 : views);

  void displayInfo() {
    print('$title | Views: $views | Likes: $likes | Engagement: ${engagement.toStringAsFixed(4)}');
  }
}

void main() {
  print('Nhập số lượng video TikTok:');
  int n = _readInt();

  List<TiktokVideo> videos = [];

  for (int i = 0; i < n; i++) {
    print('\n--- Video thứ ${i + 1} ---');
    stdout.write('Tiêu đề: ');
    String title = stdin.readLineSync()!;
    print('Lượt xem:');
    int views = _readInt();
    print('Lượt thích:');
    int likes = _readInt();

    videos.add(TiktokVideo(title, views, likes, i)); // lưu thứ tự gốc
  }

  //Xếp hạng theo engagement , views , stable sort
  videos.sort((a, b) {
    int cmpEng = b.engagement.compareTo(a.engagement);
    if (cmpEng != 0) return cmpEng;
    int cmpViews = b.views.compareTo(a.views);
    if (cmpViews != 0) return cmpViews;
    return a.originalIndex.compareTo(b.originalIndex); // stable
  });

  print('\n Danh sách video sau khi xếp hạng:');
  for (int i = 0; i < videos.length; i++) {
    print('${i + 1}. ');
    videos[i].displayInfo();
  }

  //Chia bucket theo lượt xem 
  List<TiktokVideo> bucket1 = videos.where((v) => v.views < 10000).toList();
  List<TiktokVideo> bucket2 = videos.where((v) => v.views >= 10000 && v.views <= 100000).toList();
  List<TiktokVideo> bucket3 = videos.where((v) => v.views > 100000).toList();

  print('\n Top 2 video có engagement cao nhất trong mỗi bucket:');
  _printTopK(bucket1, 2, 'Bucket 1 (<10K views)');
  _printTopK(bucket2, 2, 'Bucket 2 (10K–100K views)');
  _printTopK(bucket3, 2, 'Bucket 3 (>100K views)');

  // Tiêu đề dài nhất và ngắn nhất
  if (videos.isNotEmpty) {
    TiktokVideo longest = videos.reduce((a, b) => a.title.length > b.title.length ? a : b);
    TiktokVideo shortest = videos.reduce((a, b) => a.title.length < b.title.length ? a : b);

    print('\n Video có tiêu đề dài nhất:');
    longest.displayInfo();

    print('\n Video có tiêu đề ngắn nhất:');
    shortest.displayInfo();
  }
}

/// Lấy top-K trong bucket (đã sort theo engagement)
void _printTopK(List<TiktokVideo> bucket, int k, String title) {
  print('\n$title');
  if (bucket.isEmpty) {
    print('(Không có video trong bucket này)');
    return;
  }
  // sort riêng từng bucket để đảm bảo engagement , views 
  bucket.sort((a, b) {
    int cmpEng = b.engagement.compareTo(a.engagement);
    if (cmpEng != 0) return cmpEng;
    return b.views.compareTo(a.views);
  });

  for (int i = 0; i < (bucket.length < k ? bucket.length : k); i++) {
    bucket[i].displayInfo();
  }
}
int _readInt() {
  while (true) {
    stdout.write('> ');
    String? input = stdin.readLineSync();
    if (input == null || input.trim().isEmpty) {
      print('Không được để trống.');
      continue;
    }
    try {
      return int.parse(input);
    } catch (_) {
      print('Vui lòng nhập số hợp lệ!');
    }
  }
}

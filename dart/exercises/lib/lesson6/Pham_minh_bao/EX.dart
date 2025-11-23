import 'dart:io';

void main() {
// tên món ăn.
  List<String> monan = ['cơm rang', 'kem', 'phở'];
  print('món ăn đầu tiên là: ${monan.first}');
  monan.add('bánh mì');
  print('tổng số món ăn là: ${monan.length}');

// danh sách điểm.
  List<double> diem = [8, 9.5, 9.6, 7.5, 8.3];
  var min = diem[0];
  var max = diem[0];
  double tong = 0;
  for (var i in diem) {
    if (i < min) min = i;
    if (i > max) max = i;
  }
  diem.add(7.6);
  for (var i in diem) {
    tong = tong + i;
  }
  var TB = tong / diem.length;
  for (var n in diem) {
    stdout.write('$n\t');
  }
  print('');
  print('điểm thấp nhất: $min');
  print('điểm cao nhất: $max');
  print('điểm trung bình: ${TB.toStringAsFixed(2)}');

  // lọc ra các số chia hết cho 3 trong list
  List<int> so = [1, 213, 34, 213, 1245, 3, 124, 232345, 6875, 5643];
  List<int> chia3 =
      so.where((n) => n % 3 == 0).toList(); // chuyển đổi thành list
  print(chia3);
  // hoặc
  so.where((n) => n % 3 == 0).forEach((n) => print(n));

  // khai báo danh sách sở thích
  List<String> st1 = ['đi chơi', 'xem phim', 'nghe nhạc'];
  List<String> st2 = ['đi chơi', 'hát karaoke', 'chơi game'];
  List<String> st3 = ['đi chơi', 'xem phim', 'chơi game'];
  Map<String, List<String>> sothich = {
    'Nguyễn Văn A': st1,
    'Trần Thị B': st2,
    'Lê Văn C': st3
  };
  for (var key in sothich.keys) {
    // '.keys': trả về các key trong map
    print('Sở thích của $key là: ${sothich[key]}'); // lấy value theo key
  }
}

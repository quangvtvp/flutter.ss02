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
  diem.forEach((n) {
    stdout.write('$n\t');
  });
  print('');
  print('điểm thấp nhất: $min');
  print('điểm cao nhất: $max');
  print('điểm trung bình: ${TB.toStringAsFixed(2)}');
}

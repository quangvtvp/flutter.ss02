void main() {
  List<int> diem = [8, 9, 5, 7, 6];
  var max = diem[0];
  var min = diem[0];
  for (var i = 0; i < diem.length; i++) {
    if (diem[i] > max) {
      max = diem[i];
    }
    if (diem[i] < min) {
      min = diem[i];
    }
  }
  print('Điểm cao nhất: $max');
  print('Điểm thấp nhất: $min');

  diem.add(9);
  print('Danh sách điểm sau khi thêm: $diem');

  int tongdiem = 0;
  for (var d in diem) {
    tongdiem += d;
  }
  double DTB = tongdiem / diem.length;
  print('Điểm trung bình: ${DTB.toStringAsFixed(2)}');
}

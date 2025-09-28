void main() {
  var diem = [9, 7, 8, 6, 5];
  var max = diem[0];
  var min = diem[0];
  for (int i = 0; i < diem.length; i++) {
    if (diem[i] > max) {
      max = diem[i];
    }
    if (diem[i] < min) {
      min = diem[i];
    }
  }
  print('Điểm cao nhất là: $max');
  print('Điểm thấp nhất là: $min');
  diem.add(10);
  print('Các điểm sau khi thêm là: $diem');
  var tongdiem = 0;
  for (int d in diem) {
    tongdiem += d;
  }
  var avg = tongdiem / diem.length;
  print('Điểm trung bình là: $avg');
}

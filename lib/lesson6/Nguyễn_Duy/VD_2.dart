void main() {
  var diem = [9, 7, 8, 6, 5];
  var max = diem[0];
  var min = diem[0];
  for (int i = 1; i < diem.length; i++) {
    if (diem[i] > max) {
      max = diem[i];
      for (int i = 0; i < diem.length; i++) {
        if (diem[i] < min) {
          min = diem[i];
        }
        print('điểm cao nhất là: $max');
        print('điểm thấp nhất là: $min');
        {
          diem.add(10);
          print('các điểm là: $diem');
          for (int diemtong in diem) {
            diemtong += diemtong;
            var avg = diemtong / diem.length;
            print('điểm trung bình là: $avg');
          }
        }
      }
    }
  }
}

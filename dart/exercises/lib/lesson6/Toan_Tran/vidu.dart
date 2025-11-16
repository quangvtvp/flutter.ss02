void main() {
  List<double> diem = [9.1, 9.2, 9.5, 9.9, 10.0];
  print('Điểm các bài kiểm tra: $diem');
  double diemCaoNhat = diem[0];
  double diemThapNhat = diem[0];
  for (double diem1 in diem) {
    if (diem1 > diemCaoNhat) diemCaoNhat = diem1;
    if (diem1 < diemThapNhat) diemThapNhat = diem1;
    print('Điểm cao nhất: $diemCaoNhat');
    print('Điểm thấp nhất: $diemThapNhat');
    double tongDiem = 0.0;
    for (double diem1 in diem) {
      tongDiem += diem1;
    }
    double diemTrungBinh = tongDiem / diem.length;
    print('Điểm trung bình: $diemTrungBinh.');
  }
}

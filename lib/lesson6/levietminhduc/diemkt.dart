void main() {
  List<double> diemKiemTra = [10, 8, 9.5, 8.5, 8];
  print('Điểm các bài kiểm tra: $diemKiemTra');

  double diemCaoNhat = diemKiemTra[0];
  double diemThapNhat = diemKiemTra[0];

  for (double diem1 in diemKiemTra) {
    if (diem1 > diemCaoNhat) diemCaoNhat = diem1;
    if (diem1 < diemThapNhat) diemThapNhat = diem1;
  }
  print('Điểm cao nhất: $diemCaoNhat');
  print('Điểm thấp nhất: $diemThapNhat');
  diemKiemTra.add(10);
  print('Sau khi thêm bài thứ 6: $diemKiemTra');
  double tongDiem = 0;
  for (double diem1 in diemKiemTra) {
    tongDiem += diem1;
  }
  double diemTrungBinh = tongDiem / diemKiemTra.length;
  print('Điểm trung bình: $diemTrungBinh.');
}
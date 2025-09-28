void main() {
  List<int> diem = [9, 10, 5, 8, 7];
  print('Điểm các bài kiểm tra: $diem');
  List<int> diemchia5 = diem.where((d) => d % 5 == 0).toList();
  print('Điểm chia hết cho 5: $diemchia5');
  List<int> diemgioi = diem.where((d) => d >= 8).toList();
  print('Điểm lớn hơn hoặc bằng 8: $diemgioi');
  int sodiemgioi = diemgioi.length;
  print('Số điểm lớn hơn hoặc bằng 8: $sodiemgioi');
  int sodiemchia5 = diemchia5.length;
  print('Số điểm chia hết cho 5: $sodiemchia5');
}
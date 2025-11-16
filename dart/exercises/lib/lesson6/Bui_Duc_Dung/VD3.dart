void main() {
  var diem = [8.0, 9.5, 5.0, 6.5, 7.0];

  var diemGioi = diem.where((d) => d >= 8).toList();
  print('Danh sách điểm giỏi: $diemGioi');
  var diemChan = diem.where((d) => d % 2 == 0).toList();
  print('Danh sách điểm chẵn: $diemChan');
  var sodiemGioi = diem.where((d) => d >= 8).length;
  print('Số điểm giỏi: $sodiemGioi');
}

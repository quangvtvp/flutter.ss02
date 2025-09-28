void main() {
  List<int> diem = [8, 6, 9, 7, 10, 5];
  List<int> diemGioi = diem.where((d) => d >= 8).toList();
  print('Điểm giỏi: $diemGioi');
  List<int> diemChang = diem.where((d) => d % 2 == 0).toList();
  print('Điểm chẵn: $diemChang');
  List<int> diemchiahet5 = diem.where((d) => d % 5 == 0).toList();
  print('Điểm chia hết cho 5: $diemchiahet5');
  int sodiemGioi = diemGioi.length;
  print('Số điểm giỏi: $sodiemGioi');
}

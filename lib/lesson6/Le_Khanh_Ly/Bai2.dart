void main() {
  List<int> diemSo = [8, 9, 7, 6, 10];
  int diemCaoNhat = diemSo[0];
  int diemThapNhat = diemSo[0];
  for (var diem in diemSo) {
    if (diem > diemCaoNhat) {
      diemCaoNhat = diem;
    }
    if (diem < diemThapNhat) {
      diemThapNhat = diem;
    }
  }
  print("Điểm cao nhất là: $diemCaoNhat");
  print("Điểm thấp nhất là: $diemThapNhat");
  diemSo.add(9);
  int tongDiem = 0;
  for (var diem in diemSo) {
    tongDiem += diem;
  }
  double diemTrungBinh = tongDiem / diemSo.length;
  print("Điểm trung bình là: $diemTrungBinh");
}

void main() {
  List<int> DiemSo = [8, 9, 7, 6, 10];
  int DiemCaoNhat = DiemSo[0];
  int DiemThapNhat = DiemSo[0];
  for (var diem in DiemSo) {
    if (diem > DiemCaoNhat) {
      DiemCaoNhat = diem;
    }
    if (diem < DiemThapNhat) {
      DiemThapNhat = diem;
    }
  }
  print("Điểm cao nhất là: $DiemCaoNhat");
  print("Điểm thấp nhất là: $DiemThapNhat");
  DiemSo.add(9);
  int tongDiem = 0;
  for (var diem in DiemSo) {
    tongDiem += diem;
  }
  double diemTrungBinh = tongDiem / DiemSo.length;
  print("Điểm trung bình là: $diemTrungBinh");
}

void main() {
  List<int> diemSo = [8, 9, 7, 6, 10];
  List<int> soChiaHetCho5 = diemSo.where((d) => d % 5 == 0).toList();
  print("Các số chia hết cho 5: $soChiaHetCho5");
}

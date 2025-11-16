void main() {
  var diem = [9, 7, 8, 6, 5];
  var diemgioi = diem.where((d) => d >= 8).toList();
  print('điểm giỏi là: $diemgioi');
  var diemchan = diem.where((d) => d % 2 == 0).toList();
  print('điểm chẵn là: $diemchan');
  var diem5 = diem.where((d) => d % 5 == 0).toList();
  print('điểm chia hết cho 5 là: $diem5');
  var diemgioi2 = diem.where((d) => d >= 8).length;
  print('số điểm giỏi là: $diemgioi2');
}

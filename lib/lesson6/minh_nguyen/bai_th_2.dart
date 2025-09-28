void main() {
  List<double> diemkiemtra = [7.5, 10, 8, 9, 9.5];
  double max = diemkiemtra[0];
  double min = diemkiemtra[0];
  double tongdiem = 0;
  for (var i = 0; i < diemkiemtra.length; i++) {
    if (diemkiemtra[i] > max) {
      max = diemkiemtra[i];
    }
    if (diemkiemtra[i] < min) {
      min = diemkiemtra[i];
    }
  }
  print('diem cao nhat la: $max , diem thap nhat la:$min');
  diemkiemtra.add(9);
  for (var diem in diemkiemtra) {
    tongdiem = tongdiem + diem;
  }
  var TB = tongdiem / diemkiemtra.length;
  print('diem trung binh la:${TB.toStringAsFixed(2)}');
}

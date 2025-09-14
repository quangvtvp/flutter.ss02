import 'dart:io';
void main() {
  print ("nhap vao chieu cao(m)");
  String? input = stdin.readLineSync();
  double? chieucao = double.tryParse(input ?? '');
  print ("nhap vao so can nang (kg)");
  String? input1 = stdin.readLineSync();
  double? cannang = double.tryParse(input1 ?? '');
  if (chieucao != null && chieucao > 0 && cannang != null && cannang > 0) {
    double bmi = cannang / (chieucao * chieucao);
    if (bmi < 18.5) {
      print("ban thieu can");
    } else if (bmi >= 18.5 && bmi < 24.9) {
      print("ban binh thuong");
    } else if (bmi >= 25 && bmi < 29.9) {
      print("ban thua can");
    } else {
      print("ban bi beo phi");
    }
  } else {
    print("vui long nhap chieu cao va can nang hop le");
  }
}
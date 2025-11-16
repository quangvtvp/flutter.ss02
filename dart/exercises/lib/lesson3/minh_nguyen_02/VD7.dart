import 'dart:io';

void main() {
  print('nhap can nang (kg)');
  var cannang = stdin.readLineSync();
  var weight = double.tryParse(cannang!);
  print('nhap chieu cao (m)');
  var chieucao = stdin.readLineSync();
  var height = double.tryParse(chieucao!);
  if (weight == null || weight <= 0 || height == null || height <= 0) {
    print('khong hop le');
    return;
  }
  double Bmi = weight / (height * height);
  if (Bmi < 18.5) {
    print('thieu can');
  } else if (Bmi < 24.9) {
    print('binh thuong');
  } else if (Bmi < 29.9) {
    print('thua can');
  } else {
    print('beo phi');
  }
}

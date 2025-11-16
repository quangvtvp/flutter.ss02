import 'dart:io';

void main() {
  print('Nhập cân nặng (kg): ');
  double? canNang = double.tryParse(stdin.readLineSync() ?? '');

  print('Nhập chiều cao (m): ');
  double? chieuCao = double.tryParse(stdin.readLineSync() ?? '');

  if (canNang == null || chieuCao == null || chieuCao <= 0) {
    print('Dữ liệu không hợp lệ.');
    return;
  }

  double bmi = canNang / (chieuCao * chieuCao);
  String phanLoai;

  if (bmi < 18.5) {
    phanLoai = 'Thiếu cân';
  } else if (bmi < 24.9) {
    phanLoai = 'Bình thường';
  } else if (bmi < 29.9) {
    phanLoai = 'Thừa cân';
  } else {
    phanLoai = 'Béo phì';
  }

  print('Chỉ số BMI: ${bmi.toStringAsFixed(2)}');
  print('Phân loại: $phanLoai');
}

import 'dart:io';
void main() {
  print('Nhập cân nặng (kg):');
  double? weight = double.tryParse(stdin.readLineSync() ?? '');
  print('Nhập chiều cao (m):');
  double? height = double.tryParse(stdin.readLineSync() ?? '');
  if (weight == null || height == null || weight <= 0 || height <= 0) {
    print('Dữ liệu không hợp lệ!');
    return;
  }
  double bmi = weight / (height * height);
  print('Chỉ số BMI: ${bmi.toStringAsFixed(2)}');
  if (bmi < 18.5) {
    print('Phân loại: Thiếu cân');
  } else if (bmi < 24.9) {
    print('Phân loại: Bình thường');
  } else if (bmi < 29.9) {
    print('Phân loại: Thừa cân');
  } else {
    print('Phân loại: Béo phì');
  }
}
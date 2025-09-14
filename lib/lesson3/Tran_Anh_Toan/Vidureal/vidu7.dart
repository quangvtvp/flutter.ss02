// Ví dụ 7: Phân loại BMI.//
import 'dart:io';
void main() {
  print('Nhập cân nặng (kg): ');
  double? weight = double.tryParse(stdin.readLineSync() ?? '');
  print('Nhập chiều cao (m): ');
  double? height = double.tryParse(stdin.readLineSync() ?? '');
  if (weight == null || weight <= 0 || height == null || height <= 0) {
    print('Cân nặng hoặc chiều cao không hợp lệ, thử lại.');
    return;
  }
    double bmi = weight / (height * height);
  if (bmi < 18.5) {
    print('Thiếu cân');
  } else if (bmi < 24.9) {
    print('Bình thường');
  } else if (bmi < 29.9) {
    print('Thừa cân');
  } else {
    print('Béo phì');
  }
  print('Chỉ số BMI của bạn là: ${bmi.toStringAsFixed(1)}');
}
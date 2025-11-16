import 'dart:io';

void main() {
  print('Bài 7: Tính chỉ số BMI');
  print('Xin chào bạn!');
  print('Nhập cân nặng (kg): ');
  double? weight = double.tryParse(stdin.readLineSync() ?? '');
  print('Nhập chiều cao (m): ');
  double? height = double.tryParse(stdin.readLineSync() ?? '');
  if (weight == null || weight <= 0 || height == null || height <= 0) {
    print('Dữ liệu không hợp lệ. Vui lòng nhập lại.');
    return;
  }
  double bmi = weight / (height * height);
  if (bmi < 18.5) {
    print('Thiếu cân(cần tăng cân)');
  } else if (bmi < 24.9) {
    print('Bình thường');
  } else if (bmi < 29.9) {
    print('Thừa cân(cần giảm cân)');
  } else {
    print('Béo phì(cần giảm mạnh cân)');
  }
  print('BMI: ${bmi.toStringAsFixed(1)}');
}
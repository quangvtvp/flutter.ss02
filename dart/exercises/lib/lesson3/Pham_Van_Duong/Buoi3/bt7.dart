import 'dart:io';

void main() {
  print('Nhập cân nặng hiện tại : ');
  double? weight = double.tryParse(stdin.readLineSync() ?? '');
  print('Nhập chiều cao hiện tại : ');
  double? height = double.tryParse(stdin.readLineSync() ?? '');
  if (weight == null || weight <= 0 || height == null || height <= 0) {
    print('Dữ liệu không hợp lệ.');
    return;
  }
  double bmi = weight / (height * height);
  String BMI = (bmi < 18.5)
      ? 'Thiếu cân'
      : (bmi < 24.9)
          ? 'Bình thường'
          : (bmi < 29.9)
              ? 'Thừa cân'
              : 'Béo phì';
  print('BMI: ${bmi.toStringAsFixed(1)}, Phân loại: $BMI');
}

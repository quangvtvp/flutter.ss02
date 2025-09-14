import 'dart:io';

void main() {
  print("Nhập chiều cao: ");
  double? height = double.tryParse(stdin.readLineSync()!);
  print("Nhập cân nặng: ");
  double? weight = double.tryParse(stdin.readLineSync()!);
  if (height == null || weight == null || weight <= 0 || weight <= 0) {
    print('Chiều cao hoặc cân nặng không hợp lệ');
    return;
  }
  double bmi = weight / (height * height);
  switch (bmi) {
    case < 18.5:
      print('Thiếu cân');
      break;
    case < 24.9:
      print('Bình thường');
      break;
    case < 29.9:
      print('Thừa cân');
      break;
    default:
      print('Béo phì');
  }
}

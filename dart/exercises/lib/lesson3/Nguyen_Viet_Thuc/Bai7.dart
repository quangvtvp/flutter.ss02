import 'dart:io';

void main() {
  print("Nhập cân nặng (kg): ");
  var weightInput = stdin.readLineSync();
  var weight = double.tryParse(weightInput!);
  print("Nhập chiều cao (m): ");
  var heightInput = stdin.readLineSync();
  var height = double.tryParse(heightInput!);
  if (weight != null && height != null) {
    var bmi = weight / (height * height);
    print("Chỉ số BMI của bạn là: ${bmi.toStringAsFixed(2)}");
    if (bmi < 18.5) {
      print("Thiếu cân");
    } else if (bmi >= 18.5 && bmi < 24.9) {
      print("Bình thường");
    } else if (bmi >= 24.9 && bmi < 29.9) {
      print("Thừa cân");
    } else {
      print("Béo phì");
    }
  } else {
    print("Thông tin không hợp lệ.");
  }
}

// Phân loại BMI: Nhập cân nặng (kg) và chiều cao (m). Tính BMI = kg / (m²). In phân loại: <18.5: “Thiếu cân”; <24.9: “Bình thường”; <29.9: “Thừa cân”; còn lại: “Béo phì”.

import 'dart:io';

void main() {
  print('Nhập cân nặng của bạn (kg):');
  String? input1 = stdin.readLineSync();
  double? kg = double.tryParse(input1!);
  print('Nhập chiều cao của bạn (m):');
  String? input2 = stdin.readLineSync();
  double? m = double.tryParse(input2!);
  if (kg == null || m == null || kg <= 0 || m <= 0) {
    print(
        'một trong số các thông tin được nhập không hợp lệ, vui lòng nhập lại');
    return main();
  } else {
    double bmi = kg / (m * m);
    if (bmi < 18.5) {
      print('Bạn thiếu cân');
    } else if (bmi < 24.9) {
      print('Bạn bình thường');
    } else if (bmi < 29.9) {
      print('Bạn thừa cân');
    } else {
      print('Bạn béo phì');
    }
  }
}

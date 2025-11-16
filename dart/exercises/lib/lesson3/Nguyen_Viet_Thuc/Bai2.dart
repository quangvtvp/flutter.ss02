import 'dart:io';

void main() {
  print("Nhập số tuổi của bạn: ");
  var input = stdin.readLineSync();
  var age = int.tryParse(input!);
  if (age == null || age < 0) {
    print("Giá trị bạn nhập không phải là số tuổi hợp lệ");
  } else if (age < 18) {
    print("Bạn chưa đủ tuổi để lái xe");
  } else if (age >= 18) {
    print("Bạn đủ tuổi để lái xe");
  }
}

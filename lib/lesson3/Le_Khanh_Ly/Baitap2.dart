import 'dart:io';

void main() {
  print('Nhập vào tuổi của bạn: ');
  String? input = stdin.readLineSync();
  int? age = int.tryParse(input ?? '');

  if (age == null || age < 0) {
    print('Vui lòng nhập một số hợp lệ.');
    return;
  }
  if (age >= 18) {
    print('Bạn đủ điều kiện thi bằng lái xe.');
  } else {
    print('Bạn chưa đủ điều kiện thi bằng lái xe.');
  }
}

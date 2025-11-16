import 'dart:io';

void main() {
  print('Nhập tiền:');
  double? money = double.tryParse(stdin.readLineSync()!);
  if (money == null || money < 0) {
    print('Số tiền không hợp lệ');
    return;
  }
  switch (money) {
    case var m when m >= 500000:
      print('phí vận chuyển: Miễn phí');
      break;
    case var m when m >= 200000 && m < 500000:
      print('phí vận chuyển : 15.000');
      break;
    case var m when m < 200000:
      print('phí vận chuyển : 30.000');
      break;
  }
}

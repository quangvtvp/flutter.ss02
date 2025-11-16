import 'dart:io';

void main() {
  stdout.write('Nhập số thứ nhất: ');
  int a = int.parse(stdin.readLineSync()!);
  stdout.write('Nhập số thứ hai: ');
  int b = int.parse(stdin.readLineSync()!);
  print(
      'Menu: \n 1. Cộng \n 2. Trừ \n 3. Nhân \n 4. Chia \n 5.Nhập "exit" để thoát.');
  while (true) {
    dynamic input = stdin.readLineSync();
    int break2 = 0;
    switch (input) {
      case '1':
        cong(a, b);
      case '2':
        tru(a, b);
      case '3':
        nhan(a, b);
      case '4':
        chia(a, b);
      case 'exit':
        break2 = 1;
      default:
        print('Lựa chọn không hợp lệ, vui lòng chọn lại.');
        continue;
    }
    if (break2 == 1) {
      print('Thoát chương trình.');
      break;
    }
  }
  print('Goodbye!');
}

cong(int a, int b) => print('Tổng là: ${a + b}');
tru(int a, int b) => print('Hiệu là: ${a - b}');
nhan(int a, int b) => print('Tích là: ${a * b}');
chia(int a, int b) => print('Thương là: ${a / b}');

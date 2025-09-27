import 'dart:io';

void main() {
  print('Nhập số a:');
  int? a;
  int? b;
  do {
    do {
      a = int.tryParse(stdin.readLineSync()!);
      if (a == null || a < 0) print('Nhập lại');
    } while (a == null || a < 0);
    print('Nhập số b:');
    do {
      b = int.tryParse(stdin.readLineSync()!);
      if (b == null || b < 0) print('Nhập lại');
    } while (b == null || b < 0);
    if (b - a < 0) print('Khoảng không hợp lệ, nhập lại a:');
  } while (b - a < 0);
  int check = a;
  while (check <= b) {
    bool flag = true;
    for (int i = 2; i < check; i++) {
      if (check % i == 0) {
        flag = false;
        break;
      }
    }
    if (flag) {
      stdout.write('${check} ');
    }
    check++;
  }
}

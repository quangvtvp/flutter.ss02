import 'dart:io';

void main() {
  print('Nhap so n: ');
  int n = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  if (n <= 0 || n == null) {
    print('n khong hop le');
    return;
  }

  int count = 0;

  while (n > 0) {
    count++;
    n ~/= 10;
  }

  print("Số chữ số là: $count");
}

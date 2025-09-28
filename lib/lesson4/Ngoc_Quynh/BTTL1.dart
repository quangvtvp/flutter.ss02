import 'dart:io';

void main() {
  print(' BANG NHAN: ');
  int? n = int.tryParse(stdin.readLineSync()!);
  if (n == null || n < 0) {
    print('Khong hop le');
    return;
  }
  for (int i = 1; i <= n; i++) {
    print(' BANG NHAN $i ');
    for (int j = 1; j < 10; j++) {
      print('$i * $j = ${i * j}');
    }
    print('---------------');
  }
}

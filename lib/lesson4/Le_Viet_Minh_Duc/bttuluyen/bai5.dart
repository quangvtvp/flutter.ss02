import 'dart:io';

void main() {
  print('Xin chào bạn!');
  print('Chào mừng bạn đến với chương trình đếm số nguyên tố trong đoạn từ a đến b');
  stdout.write('Vui lòng nhập số nguyên dương a: ');
  String? inputA = stdin.readLineSync();
  int? a = int.tryParse(inputA ?? '');
  if (a == null) {
    print('Số a không hợp lệ. Vui lòng nhập số nguyên dương >= 2.');
    return;
  }
  stdout.write('Vui lòng nhập số nguyên dương b: ');
  String? inputB = stdin.readLineSync();
  int? b = int.tryParse(inputB ?? '');
  if (b == null || b < 2 || b < a) {
    print('Số b không hợp lệ. b phải lớn hơn hoặc bằng a.');
    return;
  }

  print('Các số nguyên tố trong đoạn từ $a đến $b là:');
  int count = 0;
  for (int i = a; i <= b; i++) {
    if (isPrime(i)) {
      stdout.write('$i ');
      count++;
    }
  }
  print('\nCó tất cả $count số nguyên tố trong đoạn từ $a đến $b.');
  print('Chương trình kết thúc. Cảm ơn bạn đã sử dụng!');
}

bool isPrime(int n) {
  if (n < 2) return false;
  if (n == 2) return true;
  if (n % 2 == 0) return false;
  for (int i = 3; i * i <= n; i += 2) {
    if (n % i == 0) return false;
  }
  return true;
}
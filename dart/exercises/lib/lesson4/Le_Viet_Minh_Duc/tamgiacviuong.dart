import 'dart:io';

void main() {
  print('Bài tập: Vẽ hình tam giác vuông bằng dấu *');
  print('Xin chào bạn!');
  stdout.write('Nhập vào chiều cao của tam giác vuông: ');
  int height = int.tryParse(stdin.readLineSync()!) ?? 0;
  while (true) {
    if (height <= 0) {
      print('Chiều cao không hợp lệ. Vui lòng nhập số nguyên dương.');
      stdout.write('Nhập vào chiều cao của tam giác vuông: ');
      height = int.tryParse(stdin.readLineSync()!) ?? 0;
    } else {
      break;
    }
  }

  for (int i = 1; i <= height; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write('*');
    }
    print('');
  }
}

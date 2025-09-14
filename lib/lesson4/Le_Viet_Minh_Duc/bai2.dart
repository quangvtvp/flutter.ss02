//Vẽ hình tam giác cân bằng dấu *
import 'dart:io';

void main() {
  print('Bài 2: Vẽ hình tam giác cân bằng dấu *');
  print('Xin chào bạn!');
  stdout.write('Nhập vào chiều cao của tam giác cân: ');
  int height = int.tryParse(stdin.readLineSync()!) ?? 0;
  if (height == null || height <= 0) {
    print('Chiều cao phải là số nguyên dương. Vui lòng nhập lại.');
    return;
  }
  print('TA CÓ TAM GIÁC CÂN:');
  for (int i = 1; i <= height; i++) {
    // In đoạn cách
    for (int j = height - i; j > 0; j--) {
      stdout.write(' ');
    }
    // In dấu *
    for (int k = 1; k <= (2 * i - 1); k++) {
      stdout.write('*');
    }
    print('');
  }
}

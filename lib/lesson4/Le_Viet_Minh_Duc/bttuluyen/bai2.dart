import 'dart:io';

void main() {
  print('Xin chào bạn!');
  print('Chào mừng bạn đến với chương trình vẽ hình tam giác cân rỗng bằng dấu sao (*)');

  int height;
  while (true) {
    stdout.write('Vui lòng nhập chiều cao của hình tam giác (số nguyên dương): ');
    String? input = stdin.readLineSync();
    int? parsedHeight = int.tryParse(input ?? '');

    if (parsedHeight == null || parsedHeight <= 0) {
      print('Chiều cao không hợp lệ. Vui lòng nhập số nguyên dương.');
      // Continue the loop to prompt for input again
    } else {
      height = parsedHeight;
      break; // Exit the loop as valid input is received
    }
  }

  print('Hình tam giác cân rỗng với chiều cao $height là:');
  for (int i = 1; i <= height; i++) {
    // In khoảng trắng bên trái
    for (int j = 1; j <= height - i; j++) {
      stdout.write(' ');
    }
    // In dấu sao và khoảng trắng bên trong
    for (int k = 1; k <= (2 * i - 1); k++) {
      if (k == 1 || k == (2 * i - 1) || i == height) {
        stdout.write('*');
      } else {
        stdout.write(' ');
      }
    }
    print('');
  }
}
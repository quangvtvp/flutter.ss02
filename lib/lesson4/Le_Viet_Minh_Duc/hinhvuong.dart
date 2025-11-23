import 'dart:io';
void main() {
  print('Bài tập: Vẽ hình vuông rỗng bằng dấu *');
  print('Xin chào bạn!');
  stdout.write('Nhập vào độ dài cạnh của hình vuông: ');
  int side = int.tryParse(stdin.readLineSync()!) ?? 0;
  while(true) {
    if (side <= 0) {
      print('Độ dài cạnh không hợp lệ. Vui lòng nhập số nguyên dương.');
      stdout.write('Nhập vào độ dài cạnh của hình vuông: ');
      side = int.tryParse(stdin.readLineSync()!) ?? 0;
    } else {
      break;
    }
  }

  for (int i = 1; i <= side; i++) {
    for (int j = 1; j <= side; j++) {
      if (i == 1 || i == side || j == 1 || j == side) {
        stdout.write('* ');
      } else {
        stdout.write('  ');
      }
    }
    print('');
  }
}
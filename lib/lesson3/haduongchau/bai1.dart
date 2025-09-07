import 'dart:io';

void main() {
  print('Nhap gio (0-23): ');
  int? hour = int.tryParse(stdin.readLineSync() ?? '');
  if (hour == null || hour < 0 || hour > 23) {
    print('Gio khong hop le. Vui long nhap lai.');
    return;
  }
  if (hour < 12 && hour >= 0) {
    print('Chao buoi sang!');
  } else if (hour < 18 && hour >= 12) {
    print('Chao buoi chieu!');
  } else {
    print('Chao buoi toi!');
  }
}

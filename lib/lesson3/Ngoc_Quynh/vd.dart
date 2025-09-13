import 'dart:io';

void main() {
  print('Vui long nhap gio hien tai(0-24):  ');
  String? input = stdin.readLineSync();
  int? hour = int.tryParse(input ?? '');
  if (hour == null || hour < 0 || hour > 24) {
    print('Gio khong hop le, thu lai');
    return;
  }
  if (hour < 12) {
    print(' Chao buoi sang');
  } else if (hour < 18) {
    print('Chao buoi chieu');
  } else {
    print('Chao buoi toi');
  }
}

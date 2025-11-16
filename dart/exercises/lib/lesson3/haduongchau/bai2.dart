import 'dart:io';

void main() {
  print('ban da chon goi 1GB ,nhap so tien nap:');
  int? tien = int.tryParse(stdin.readLineSync() ?? '');
  if (tien == null) {
    print('gia tri khong hop le');
  } else if (tien % 100 != 0) {
    print('vui long nhap so tien la boi cua 100');
  } else if (tien < 5000) {
    print('so tien khong hop le');
  } else if (tien == 5000) {
    print('ban duoc 1GB');
  } else if (tien > 5000) {
    double gb = 1 + ((tien - 5000) / 20000);
    print('ban nhan duoc:${gb.toStringAsFixed(1)}GB');
  }
}

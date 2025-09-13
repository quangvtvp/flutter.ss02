import 'dart:io';

void main() {
  print('ban da chon goi 3GB ,nhap so tien nap:');
  int ? tien = int.tryParse (stdin.readLineSync() ?? '');
  if (tien == null) {
    print('gia tri khong hop le');
  } else if (tien % 100 !=0) {
    print('vui long nhap so tien la boi cua 100');
  } else if (tien <15000) {
    print('so tien khong hop le');
  } else if (tien ==15000) {
    print('ban duoc 3GB');
  } else if (tien >15000) {
    double gb = 3+((tien-15000)/20000);
    print('ban nhan duoc:${gb.toStringAsFixed(1)}GB');
  }
}
import 'dart:io';

void main() {
  print('nhap RL (0-100)');
  var RL = int.tryParse(stdin.readLineSync()!);
  if (RL == null || RL < 0 || RL > 100) {
    print('khong hop le');
    return;
  }
  if (RL >= 90) {
    print('xuat sac');
  } else if (RL >= 80) {
    print('tot');
  } else if (RL >= 65) {
    print('kha');
  } else if (RL >= 50) {
    print('trung binh');
  } else {
    print('yeu');
  }
}

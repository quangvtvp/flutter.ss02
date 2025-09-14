import 'dart:io';

void main() {
  print('nhap hanh kiem cua ban (A,B,C,D):');
  var hk = stdin.readLineSync();
  switch (hk) {
    case 'A':
      print('tot');
      break;
    case 'B':
      print('kha');
      break;
    case 'C':
      print('TB');
      break;
    case 'D':
      print('yeu');
      break;
    default:
      print('khong hop le');
  }
}

import 'dart:io';

void main() {
  print('Nhập hạng của bạn : ');
  String tier = stdin.readLineSync()?.trim().toLowerCase() ?? '';
  int giamgia;
  switch (tier) {
    case 'bronze':
      giamgia = 0;
      break;
    case 'silver':
      giamgia = 5;
      break;
    case 'gold':
      giamgia = 10;
      break;
    case 'platinum':
      giamgia = 15;
      break;
    default:
      giamgia = 0;
  }
  print('Bạn đượcgiảm giá: $giamgia%');
}

import 'dart:io';

void main() {
  print('Nhập hạng thành viên (bronze/silver/gold/platinum): ');
  String hang = stdin.readLineSync()?.trim().toLowerCase() ?? '';

  int giamGia;

  switch (hang) {
    case 'bronze':
      giamGia = 0;
      break;
    case 'silver':
      giamGia = 5;
      break;
    case 'gold':
      giamGia = 10;
      break;
    case 'platinum':
      giamGia = 15;
      break;
    default:
      print('Hạng không hợp lệ.');
      return;
  }

  print('Giảm giá: $giamGia%');
}
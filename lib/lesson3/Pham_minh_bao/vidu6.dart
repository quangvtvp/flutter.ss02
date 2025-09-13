// Giảm giá theo hạng thành viên: Nhập hạng thành viên bronze/silver/gold/platinum rồi in phần trăm giảm giá tương ứng: 0/5/10/15%.

import 'dart:io';

void main() {
  print('Nhập hạng thành viên của bạn (bronze/silver/gold/platinum): ');
  String? hang = stdin.readLineSync();
  switch (hang) {
    case 'bronze':
      print('Giảm giá 0%');
      break;
    case 'silver':
      print('Giảm giá 5%');
      break;
    case 'gold':
      print('Giảm giá 10%');
      break;
    case 'platium':
      print('Giảm giá 15%');
      break;
    default:
      print('vui lòng nhập lại, hạng thành viên không hợp lệ!');
      return main();
  }
}

// Ví dụ 6: Giảm giá theo hạng thành viên.//
import 'dart:io';
void main() {
  print('Nhập hạng (bronze/silver/gold/platinum): ');
  String rank = stdin.readLineSync()?.trim().toLowerCase() ?? '';
  int discount;
  switch (rank) {
    case 'bronze':
      discount = 0;
      break;
    case 'silver':
      discount = 5;
      break;
    case 'gold':
      discount = 10;
      break;
    case 'platinum':
      discount = 15;
      break;
    default:
      print('Hạng không hợp lệ.');
      return;
  }
  print('Bạn được giảm giá: $discount%');
}
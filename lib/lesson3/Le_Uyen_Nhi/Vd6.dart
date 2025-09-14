import 'dart:io';

void main() {
  print('Nhập hạng (bronze/silver/gold/platinum): ');
  String tier = stdin.readLineSync()?.trim().toLowerCase() ?? '';
  int discount;
  switch (tier) {
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
      discount = 0;
  }
  print('Giảm giá: $discount%');
}

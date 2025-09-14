import 'dart:io';
void main() {
  print('Nhập hạng thành viên (bronze/silver/gold/platinum):');
  String tier = stdin.readLineSync()?.toLowerCase() ?? '';
  int discount;
  if (tier == 'bronze') {
    discount = 0;
  } else if (tier == 'silver') {
    discount = 5;
  } else if (tier == 'gold') {
    discount = 10;
  } else if (tier == 'platinum') {
    discount = 15;
  } else {
    print('Hạng không hợp lệ.');
    return;
  }
  print('Giảm giá: $discount%');
}

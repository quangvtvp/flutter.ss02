import 'dart:io';

void main() {
  print('vui lòng nhập thu nhập của bạn trong tháng (đơn vị nghìn đồng) :');
  int tien = int.parse(stdin.readLineSync()!);
  if (tien < 0) {
    print('số tiền không hợp lệ');
  } else if (tien <= 11000) {
    print('bạn không cần phải đóng thuế');
  } else if (tien <= 20000) {
    print(
        'số tiền thuế bạn phải đóng là: ${((tien - 11000) * 0.05).toInt()} nghìn đồng');
  } else if (tien <= 32000) {
    print(
        'số tiền thuế bạn phải đóng là: ${((tien - 20000) * 0.1 + 450).toInt()} nghìn đồng');
  } else if (tien > 32000) {
    print(
        'số tiền thuế bạn phải đóng là: ${((tien - 32000) * 0.15 + 1570).toInt()} nghìn đồng');
  }
}

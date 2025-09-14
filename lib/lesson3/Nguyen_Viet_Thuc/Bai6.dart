import 'dart:io';

void main() {
  print("Nhập hạng của bạn:");
  var input = stdin.readLineSync();
  if (input == 'bronze') {
    print("Phần trăm giảm giá của bạn là 0%");
  } else if (input == 'silver') {
    print("Phần trăm giảm giá của bạn là 5%");
  } else if (input == 'gold') {
    print("Phần trăm giảm giá của bạn là 10%");
  } else if (input == 'platinum') {
    print("Phần trăm giảm giá của bạn là 15%");
  } else {
    print("Hạng nhập không hợp lệ");
  }
}

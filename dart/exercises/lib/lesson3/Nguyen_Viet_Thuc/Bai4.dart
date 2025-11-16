import 'dart:io';

void main() {
  print("Nhập tổng số tiền(đ): ");
  var input = stdin.readLineSync();
  var money = int.tryParse(input!);
  if (money == null || money < 0) {
    print("Số tiền không hợp lệ");
  } else if (money >= 500000) {
    print("Miễn phí vận chuyển");
  } else if (money < 500000 && money >= 200000) {
    print("Phí vận chuyển là 15000đ");
  } else if (money < 500000 && money >= 200000) {
    print("Phí vận chuyển là 15000đ");
  } else {
    print("Phí vận chuyển là 30000đ");
  }
}

import 'dart:io';

void main() {
  print('vui lòng nhập số data đã sử dụng trong tháng:');
  double data = double.parse(stdin.readLineSync()!);
  var tien = data.toStringAsFixed(1);
  double tien1 = double.parse(tien);
  var tien2 = 20000 * (tien1 - 3);
  if (data <= 3) {
    print('SỐ TIỀN CƯỚC CỦA BẠN LÀ: 0 ĐỒNG');
  } else if (data > 3) {
    print('SỐ TIỀN CƯỚC CỦA BẠN LÀ : ${tien2.toInt()} ĐỒNG');
  }
}

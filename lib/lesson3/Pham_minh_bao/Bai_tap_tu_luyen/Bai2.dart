// Cước data: Gói cơ bản 3GB/tháng; vượt ngưỡng tính 20.000đ/GB (làm tròn lên theo 0.1GB). In tổng tiền

import 'dart:io';

void main() {
  print('nhập số dung lượng đã sử dụng (đơn vị: GB): ');
  String? input = stdin.readLineSync();
  double? data = double.tryParse(input!);
  if (data == null || data < 0) {
    print('Vui lòng nhập một số hợp lệ cho dung lượng đã sử dụng.');
    return main();
  } else if (data <= 3) {
    print('Gói cước miễn phí, tổng tiền là 0đ');
  } else {
    int tong;
    double GB = data - 3;
    if (GB % 0.1 == 0) {
        tong = (GB.toInt()) * 20000;
    } else {
        tong = (GB.ceil()) * 20000;
    }
    print('Tổng số tiền phải trả là: $tong đ');
  }
}

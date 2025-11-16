// Tính phí vận chuyển: Nhập tổng tiền (đồng). Nếu ≥ 500.000 miễn phí; nếu ≥ 200.000 phí 15.000; còn lại 30.000. In số tiền phí.

import 'dart:io';

void main() {
  print('nhập tổng số tiền của bạn (đơn vị: nghìn đồng): ');
  String? input = stdin.readLineSync();
  double? gia = double.tryParse(input!);
  if (gia == null || gia < 0) {
    print('số tiền được nhập sai, hãy nhập lại!');
    return main();
  } else if (gia < 200) {
    print('phí vận chuyển của bạn là 30.000 đồng.');
  } else if (gia >= 200 && gia < 500) {
    print('phí vận chuyển của bạn là 15.000 đồng.');
  } else {
    print('phí vận chuyển của bạn là 0 đồng.');
  }
}

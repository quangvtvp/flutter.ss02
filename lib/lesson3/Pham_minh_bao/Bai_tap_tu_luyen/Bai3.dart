// Thuế TNCN (đơn giản): Thu nhập <11tr: 0%; 11–20: 5%; 20–32: 10%; >32: 20%. In số thuế.

import 'dart:io';

void main() {
  print('Nhập mức lương của bạn: ');
  String? input = stdin.readLineSync();
  double? luong = double.tryParse(input!);
  if (luong == null || luong < 0) {
    print('Vui lòng nhập lại mức lương hợp lệ.');
    return main();
  } else if (luong < 11000000) {
    print('Mức thuế là: 0đ');
  } else if (luong <= 20000000) {
    print('Thuế của bạn là 5%, tức bạn cần nộp: ${luong * 0.05}đ');
  } else if (luong <= 32000000) {
    print('Thuế của bạn là 10%, tức bạn cần nộp: ${luong * 0.1}đ');
  } else {
    print('Thuế của bạn là 20%, tức bạn cần nộp: ${luong * 0.2}đ');
  }
}

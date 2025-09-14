import 'dart:io';

void main() {
  print("Nhập tiền lương 1 tháng: ");
  double? luong = double.tryParse(stdin.readLineSync()!);
  if (luong == null || luong < 0) {
    print("Giá trị nhập vào không hợp lệ.");
    return;
  }
  switch (luong) {
    case var l when l <= 11_000_000:
      print("Thuế thu nhập cá nhân phải nộp: ${luong * 0}");
      break;
    case var l when l <= 20_000_000:
      print("Thuế thu nhập cá nhân: ${luong * 0.05}");
      break;
    case var l when l <= 32_000_000:
      print("Thuế thu nhập cá nhân: ${luong * 0.1}");
      break;
    default:
      print("Thuế thu nhập cá nhân: 20%");
  }
}

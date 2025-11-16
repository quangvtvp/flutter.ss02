import 'dart:io';

void main() {
  Map<String, double> khoanchitieu = {};
  print("Nhập các khoản chi tiêu (nhập 'exit' để thoát):");
  while (true) {
    String? tenKhoan = stdin.readLineSync();
    if (tenKhoan == 'exit') {
      break;
    }
    String? soTienStr = stdin.readLineSync();
    if (soTienStr == 'exit') {
      break;
    }
    double soTien = double.tryParse(soTienStr!) ?? 0;
    khoanchitieu[tenKhoan!] = soTien;
  }
  double tongChiTieu = 0;
  double maxChiTieu = 0;
  khoanchitieu.forEach((key, value) {
    tongChiTieu += value;
    if (value > maxChiTieu) {
      maxChiTieu = value;
    }
  });
  print("Tổng chi tiêu: $tongChiTieu");
  print("Khoản chi tiêu lớn nhất: $maxChiTieu");
}

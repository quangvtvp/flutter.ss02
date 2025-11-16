import 'dart:io';

void main() {
  Map<String, double> chitieu = {};
  print('Nhập các chỉ tiêu muốn thêm: (Nhập exit để thoát) ');
  while (true) {
    String? a = stdin.readLineSync()!;
    String? b = stdin.readLineSync()!;
    if (a == 'exit' || b == 'exit') {
      break;
    }
    double c = double.tryParse(b)!;
    chitieu[a] = c;
  }
  double tong = 0;
  double max = 0;
  chitieu.forEach((key, value) {
    tong += value;
  });
  chitieu.forEach((key, value) {
    if (value > max) {
      max = value;
    }
  });
  print('Tổng số tiền đã chi: $tong');
  print('Chỉ tiêu lớn nhất là: $max');
}

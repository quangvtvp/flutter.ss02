// Bài tập 1: Quản lý chi tiêu
// Tạo một Map<String, double> để lưu các khoản chi tiêu trong ngày.
// Tính tổng số tiền đã chi.
// In ra khoản chi nhiều nhất.

import 'dart:io';

void main() {
  Map<String, double> chitieu = {};
  print('nhập vào các khoản chi tiêu trong ngày (cách nhau bằng dấu phẩy):');
  String n = stdin.readLineSync()!;
  List<String> khoanchi = n.split(', ');
  for (String i in khoanchi) {
    stdout.write('Nhập giá trị của khoản chi "$i" (đơn vị: VND): ');
    double tien = double.tryParse(stdin.readLineSync() ?? '')!;
    chitieu[i] = tien;
  }
  print('Danh sách các khoản chi tiêu là: $chitieu');
  double tong = 0;
  double max = 0;
  String maxkey = '';
  for (String a in chitieu.keys) {
    tong += chitieu[a]!;
    if (chitieu[a]! > max) {
      max = chitieu[a]!;
      maxkey = a;
    }
  }
  print('Tổng chi tiêu là: $tong VND');
  print('Khoản chi tiêu nhiều nhất là: $maxkey với số tiền: $max VND');
}

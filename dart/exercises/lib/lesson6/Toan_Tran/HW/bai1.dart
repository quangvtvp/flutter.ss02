// Bài tập 1: Quản lý chi tiêu.//
import 'dart:io';
void main() {
  Map<String, double> chiTieu = {};

  print('=== QUẢN LÝ CHI TIÊU ===');
  print('Nhập từng khoản chi (gõ "done" để kết thúc)\n');
  while (true) {
    stdout.write('Tên khoản chi: ');
    String? ten = stdin.readLineSync();
    // Gõ 'done' để thoát vòng lặp.//
    if (ten == null || ten.toLowerCase() == 'done') break;
    stdout.write('Số tiền đã chi (VND): ');
    String? tienNhap = stdin.readLineSync();
    double? soTien = double.tryParse(tienNhap ?? '');
    if (soTien == null) {
      print('Vui lòng nhập một số hợp lệ!');
      continue;
    }
    chiTieu[ten] = soTien;
    print('Đã thêm: $ten - ${soTien.toStringAsFixed(2)} VND\n');
  }
  if (chiTieu.isEmpty) {
    print('\nBạn chưa nhập khoản chi nào!');
    return;
  }
  double tongChi = 0;
  chiTieu.forEach((key, value) {
    tongChi += value;
  });
  String? mucChiLonNhatKey;
  double mucChiLonNhatValue = 0;
  chiTieu.forEach((key, value) {
    if (value > mucChiLonNhatValue) {
      mucChiLonNhatKey = key;
      mucChiLonNhatValue = value;
    }
  });
  print('\n=== KẾT QUẢ NGÀY HÔM NAY ===');
  print('Tổng chi tiêu: ${tongChi.toStringAsFixed(2)} VND');
  print('Khoản chi lớn nhất: $mucChiLonNhatKey (${mucChiLonNhatValue.toStringAsFixed(2)} VND)');
}

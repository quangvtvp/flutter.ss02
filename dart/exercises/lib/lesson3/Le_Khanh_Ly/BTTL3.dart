import 'dart:io';

void main() {
  print('Nhập thu nhập (triệu đồng): ');
  String? input = stdin.readLineSync();
  double? ThuNhap = double.tryParse(input ?? '');

  if (ThuNhap == null || ThuNhap < 0) {
    print('Dữ liệu không hợp lệ.');
    return;
  }

  double tyLeThue;

  if (ThuNhap <= 11) {
    tyLeThue = 0;
  } else if (ThuNhap <= 20) {
    tyLeThue = 0.05;
  } else if (ThuNhap <= 32) {
    tyLeThue = 0.10;
  } else {
    tyLeThue = 0.20;
  }
  double thuePhaiNop = ThuNhap * tyLeThue;
  print('Số thuế phải nộp: ${thuePhaiNop.toStringAsFixed(2)} triệu đồng');
}

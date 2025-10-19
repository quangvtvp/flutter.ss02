import 'dart:io';

void main() {
  Map<String, double> Chitieu = {};

  print('=== CHƯƠNG TRÌNH QUẢN LÝ CHI TIÊU ===');
  print('Nhập số mục chi tiêu: ');
  int soMuc = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < soMuc; i++) {
    print('Nhập tên mục chi tiêu thứ ${i + 1}: ');
    String tenMuc = stdin.readLineSync()!;
    print('Nhập số tiền cho mục chi tiêu $tenMuc: ');
    double soTien = double.parse(stdin.readLineSync()!);
    Chitieu[tenMuc] = soTien;
    double Tongtien = 0;
    Chitieu.forEach((muc, tien) {
      Tongtien += tien;
    });
    print('Tổng số tiền đã chi: $Tongtien');
    double max = 0;
    String mucMax = '';
    Chitieu.forEach((muc, tien) {
      if (tien > max) {
        max = tien;
        mucMax = muc;
      }
    });
    print('Mục chi tiêu lớn nhất: $mucMax với số tiền: $max');
  }
}

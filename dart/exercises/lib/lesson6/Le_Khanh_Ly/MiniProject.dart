import 'dart:io';

void main() {
  Map<String, double> tenMonVaDiem = {};
  List<String> danhSachMonGioi = [];
  stdout.write("Nhập số lượng môn học: ");
  int? soLuongMon = int.tryParse(stdin.readLineSync()!);
  for (int i = 0; i < soLuongMon!; i++) {
    stdout.write("Nhập tên môn ${i + 1}: ");
    String? tenMon = stdin.readLineSync();
    stdout.write("Nhập điểm môn $tenMon: ");
    double? diemMon = double.tryParse(stdin.readLineSync()!);
    tenMonVaDiem[tenMon!] = diemMon!;
    if (diemMon >= 8) {
      danhSachMonGioi.add(tenMon);
    }
  }
  print("Danh sách điểm các môn học:");
  tenMonVaDiem.forEach((tenMon, diemMon) {
    print("$tenMon: $diemMon");
  });
  print("Các môn học có điểm giỏi (>= 8): ${danhSachMonGioi.join(', ')}");
}

import 'dart:io';

void main() {
  // Sử dụng Map để lưu điểm số
  Map<String, double> bangDiem = {};

  print('=== CHƯƠNG TRÌNH QUẢN LÝ ĐIỂM ===');

  // Nhập số môn học
  print('Nhập số môn học: ');
  int soMon = int.parse(stdin.readLineSync()!);

  // Nhập điểm cho từng môn
  for (int i = 0; i < soMon; i++) {
    print('hập tên môn học thứ ${i + 1}: ');
    String tenMon = stdin.readLineSync()!;

    print('Nhập điểm môn $tenMon: ');
    double diem = double.parse(stdin.readLineSync()!);

    // Lưu vào Map
    bangDiem[tenMon] = diem;
  }

  // Hiển thị bảng điểm
  print('=== BẢNG ĐIỂM ===');
  bangDiem.forEach((mon, diem) {
    print('$mon: $diem điểm');
  });

  // Tính điểm trung bình
  double tongDiem = 0;
  for (double diem in bangDiem.values) {
    tongDiem += diem;
  }
  double diemTrungBinh = tongDiem / bangDiem.length;
  print('\nĐiểm trung bình: ${diemTrungBinh.toStringAsFixed(2)}');

  // Tìm các môn giỏi (>= 8.0)
  List<String> monGioi = [];
  bangDiem.forEach((mon, diem) {
    if (diem >= 8.0) {
      monGioi.add(mon);
    }
  });

  if (monGioi.isNotEmpty) {
    print('Các môn đạt điểm Giỏi: $monGioi');
  } else {
    print('Chưa có môn nào đạt điểm Giỏi (>= 8.0)');
  }

  // Tìm kiếm môn học
  print('\nNhập tên môn muốn tìm: ');
  String monCanTim = stdin.readLineSync()!;

  if (bangDiem.containsKey(monCanTim)) {
    print('Điểm môn $monCanTim: ${bangDiem[monCanTim]}');
  } else {
    print('Không tìm thấy môn $monCanTim');
  }
}

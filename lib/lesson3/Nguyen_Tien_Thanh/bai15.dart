import 'dart:io';
void main() {
  print('Nhập điểm Toán (0-10):');
  double? toan = double.tryParse(stdin.readLineSync() ?? '');
  print('Nhập điểm Văn (0-10):');
  double? van = double.tryParse(stdin.readLineSync() ?? '');
  print('Nhập điểm Ngoại ngữ (0-10):');
  double? ngoaiNgu = double.tryParse(stdin.readLineSync() ?? '');
  print('Nhập điểm Lịch sử (0-10):');
  double? lichSu = double.tryParse(stdin.readLineSync() ?? '');
  print('Nhập % chuyên cần (0-100):');
  double? chuyenCan = double.tryParse(stdin.readLineSync() ?? '');
  if ([toan, van, ngoaiNgu, lichSu, chuyenCan].any((e) => e == null)) {
    print('Bạn nhập không hợp lệ!');
    return;
  }
  if ([toan!, van!, ngoaiNgu!, lichSu!].any((d) => d < 0 || d > 10) || chuyenCan! < 0 || chuyenCan > 100) {
    print('Điểm hoặc chuyên cần ngoài phạm vi cho phép!');
    return;
  }
  double gpa = (toan + van + ngoaiNgu + lichSu) / 4;
  double gpaRounded = double.parse(gpa.toStringAsFixed(2));
  String xepLoai;
  if (gpaRounded >= 9.0) {
    xepLoai = 'Xuất sắc';
  } else if (gpaRounded >= 8.0) {
    xepLoai = 'Giỏi';
  } else if (gpaRounded >= 6.5) {
    xepLoai = 'Khá';
  } else if (gpaRounded >= 5.0) {
    xepLoai = 'Trung bình';
  } else {
    xepLoai = 'Yếu';
  }
  bool lenLop = (gpaRounded >= 5.0) &&
      toan >= 3.5 &&
      van >= 3.5 &&
      ngoaiNgu >= 3.5 &&
      lichSu >= 3.5 &&
      chuyenCan >= 80;
  String loiKhuyen;
  if (lenLop) {
    loiKhuyen = 'Giữ vững phong độ và tiếp tục cố gắng!';
  } else if (gpaRounded < 5.0) {
    loiKhuyen = 'Cần chú ý học tập hơn, đặc biệt các môn còn yếu.';
  } else if (chuyenCan < 80) {
    loiKhuyen = 'Cần cải thiện chuyên cần để đủ điều kiện lên lớp.';
  } else {
    loiKhuyen = 'Cần tập trung cải thiện điểm các môn.';
  }
  print('GPA: $gpaRounded');
  print('Xếp loại: $xepLoai');
  print('Đủ điều kiện lên lớp: $lenLop');
  print('Lời khuyên: $loiKhuyen');
}
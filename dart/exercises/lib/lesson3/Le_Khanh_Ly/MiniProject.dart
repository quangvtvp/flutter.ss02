import 'dart:io';

void main() {
  print('Nhập điểm Toán (0-10): ');
  double? toan = double.tryParse(stdin.readLineSync() ?? '');

  print('Nhập điểm Văn (0-10): ');
  double? van = double.tryParse(stdin.readLineSync() ?? '');

  print('Nhập điểm Ngoại ngữ (0-10): ');
  double? nn = double.tryParse(stdin.readLineSync() ?? '');

  print('Nhập điểm Lịch sử (0-10): ');
  double? ls = double.tryParse(stdin.readLineSync() ?? '');

  print('Nhập % chuyên cần (0-100): ');
  double? chuyenCan = double.tryParse(stdin.readLineSync() ?? '');

  if ([toan, van, nn, ls, chuyenCan].contains(null) ||
      toan! < 0 ||
      toan > 10 ||
      van! < 0 ||
      van > 10 ||
      nn! < 0 ||
      nn > 10 ||
      ls! < 0 ||
      ls > 10 ||
      chuyenCan! < 0 ||
      chuyenCan > 100) {
    print('Dữ liệu nhập không hợp lệ!');
    return;
  }

  double gpa = (toan + van + nn + ls) / 4;
  gpa = double.parse(gpa.toStringAsFixed(2));

  String xeploai;
  if (gpa >= 9.0) {
    xeploai = 'Xuất sắc';
  } else if (gpa >= 8.0) {
    xeploai = 'Giỏi';
  } else if (gpa >= 6.5) {
    xeploai = 'Khá';
  } else if (gpa >= 5.0) {
    xeploai = 'Trung bình';
  } else {
    xeploai = 'Yếu';
  }

  bool lenLop = gpa >= 5.0 &&
      toan >= 3.5 &&
      van >= 3.5 &&
      nn >= 3.5 &&
      ls >= 3.5 &&
      chuyenCan >= 80;

  String loiKhuyen;
  switch (xeploai) {
    case 'Xuất sắc':
      loiKhuyen = 'Giữ vững thành tích!';
      break;
    case 'Giỏi':
      loiKhuyen = 'Cố gắng phát huy hơn nữa.';
      break;
    case 'Khá':
      loiKhuyen = 'Cần chăm chỉ hơn.';
      break;
    case 'Trung bình':
      loiKhuyen = 'Phải nỗ lực nhiều hơn.';
      break;
    default:
      loiKhuyen = 'Cần cố gắng rất nhiều!';
  }

  print('\nKết quả:');
  print('GPA: $gpa');
  print('Xếp loại: $xeploai');
  print('Đủ điều kiện lên lớp: ${lenLop ? "Có" : "Không"}');
  print('Lời khuyên học tập: $loiKhuyen');
}

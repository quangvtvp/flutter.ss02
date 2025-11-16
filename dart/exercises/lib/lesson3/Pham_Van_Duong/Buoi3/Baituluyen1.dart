import 'dart:io';

void main() {
  print(' Nhập điêm rèn luyện (0->100) : ');
  String diem = stdin.readLineSync() ?? '';
  int? score = int.tryParse(diem);
  if (score == null || score < 0 || score > 100) {
    print(' Điểm không hợp lệ ');
    return;
  }
  String ketqua = (score >= 90)
      ? ' Xuất sắc '
      : (score >= 80 && score < 89)
          ? ' Tốt '
          : (score >= 65 && score < 79)
              ? ' Khá '
              : (score >= 50 && score < 64)
                  ? ' Trung bình '
                  : ' Yếu ';
  print(' $ketqua, Xếp loại $score ');
}

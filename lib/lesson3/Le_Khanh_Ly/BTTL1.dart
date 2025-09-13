import 'dart:io';

void main() {
  print('Nhập điểm rèn luyện (0-100): ');
  String? input = stdin.readLineSync();
  int? score = int.tryParse(input ?? '');
  if (score == null || score < 0 || score > 100) {
    print('Điểm không hợp lệ.');
    return;
  }
  if (score >= 90) {
    print('Xuất sắc');
  } else if (score >= 80 && score < 89) {
    print('Tốt');
  } else if (score >= 65 && score < 79) {
    print('Khá');
  } else if (score >= 50 && score < 64) {
    print('Trung bình');
  } else {
    print('Yếu');
  }
}

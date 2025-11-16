import 'dart:io';
void main() {
  print('Bài 1: Điểm rèn luyện');
  print('Xin chào bạn!');
  print('Nhập điểm rèn luyện (0-100): ');
  int? score = int.tryParse(stdin.readLineSync() ?? '');
  if (score == null || score < 0 || score > 100) {
    print('Điểm không hợp lệ. Vui lòng nhập lại.');
    return;
  }
  if (score >= 90) {
    print('Bạn được điểm xuất sắc');
  } else if (score >= 80) {
    print('Bạn được điểm tốt');
  } else if (score >= 65) {
    print('Bạn được điểm khá');
  } else if (score >= 50) {
    print('Bạn được điểm trung bình');
  } else {
    print('Bạn được điểm yếu');
  }
}
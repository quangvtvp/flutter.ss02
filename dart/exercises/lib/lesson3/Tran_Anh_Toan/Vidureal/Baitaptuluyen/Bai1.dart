// Bài 1: Xếp loại điểm rèn luyện.//
import 'dart:io';

void main() {
  print('Nhập điểm rèn luyện: ');
  int? score = int.tryParse(stdin.readLineSync() ?? '');
  if (score == null || score < 0 || score > 100) {
    print('Điểm không hợp lệ, thử lại.');
    return;
  }
  if (score >= 90) {
    print('điểm xuất sắc');
  } else if (score >= 80) {
    print('điểm tốt');
  } else if (score >= 65) {
    print('Bạn được điểm khá');
  } else if (score >= 50) {
    print('điểm trung bình');
  } else {
    print('điểm yếu');
  }
}
